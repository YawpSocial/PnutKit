import Foundation


extension URLComponents {

    init?<A>(baseURL: String, request: Request<A>) {
        guard let realBaseURL = URL(string: baseURL)
            else { return nil }

        let completeURL = realBaseURL.appendingPathComponent(request.path)
        self.init(url: completeURL, resolvingAgainstBaseURL: true)

        path = completeURL.path
        queryItems = request.method.queryItems
    }
    
}
