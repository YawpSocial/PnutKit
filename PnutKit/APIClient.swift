import Foundation


public final class APIClient {
    let baseURL : String = "https://api.pnut.io/v0"

    public var accessToken: String?
    lazy var session = URLSession.shared

    public init(accessToken : String? = nil) {
        self.accessToken = accessToken
    }

    public func run<Model>(_ request : Request<Model>, completion : @escaping (Model?, Error?) -> Void) {
        guard
            let components = URLComponents(baseURL: baseURL, request: request),
            let requestURL = components.url
            else {
                completion(nil, ClientError.malformedURL)
                return
        }

        let urlRequest = URLRequest(url: requestURL, request: request, accessToken: accessToken)

        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, ClientError.invalidResponse(response))
                return
            }

            guard 200...299 ~= httpResponse.statusCode else {
                if let data = data,
                    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                    let serviceError = ServiceError(json: jsonObject)
                    completion(nil, ClientError.serviceError(serviceError.description))
                }
                else {
                    completion(nil, ClientError.dataError(data))
                }
                return
            }

            guard let d = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: d, options: [])
                else {
                    completion(nil, ClientError.dataError(data))
                    return
            }

            completion(request.parse(jsonObject), nil)
        }
        
        task.resume()
    }
}
