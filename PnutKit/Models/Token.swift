import Foundation


public struct Token {
    public var appId : String
    public var appLink : URL
    public var appName : String
    public var scopes : [String]
    public var user : User
}


extension Token : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let app = dict["app"] as? [String : Any],
            let appId = app["id"] as? String,
            let link = app["link"] as? String,
            let appLink = URL(string: link),
            let appName = app["name"] as? String,
            let scopes = dict["scopes"] as? [String],
        let u = dict["user"] as? [String : Any],
            let user = User(from: u)
            else { return nil }

        self.appId = appId
        self.appLink = appLink
        self.appName = appName
        self.scopes = scopes
        self.user = user
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "app" : [
                "id" : appId,
                "link" : appLink.absoluteString,
                "name" : appName,
            ],
            "scopes" : scopes,
            "user" : user.toDictionary(),
            ]
        return dict
    }

}
