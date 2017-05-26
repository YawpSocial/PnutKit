import Foundation


public struct TextProcessor {

    public static func process(text : String) throws -> Request<Content> {
        let json : JSONDictionary = [
            "text" : text,
            ]
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        let method = HTTPMethod.post(Payload.json(data))

        return Request<Content>(path: "/text/process", method: method, parse: Request<Content>.parser)
    }
    
}
