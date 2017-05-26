import Foundation


public struct Profiles {

    public static func update(name : String, text : String, timezone : String, locale : String) throws -> Request<User> {
        let json : JSONDictionary = [
            "name" : name,
            "content" : [
                "text" : text,
            ],
            "timezone" : timezone,
            "locale" : locale,
        ]
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        let method = HTTPMethod.put(Payload.json(data))

        return Request<User>(path: "/users/me", method: method, parse: Request<User>.parser)
    }

//    public static func setAvatar(userId : String, data : Data) -> Request<User> {
//
//    }
//
//    public static func setCover(userId : String, data : Data) -> Request<User> {
//
//    }

}
