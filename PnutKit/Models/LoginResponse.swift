import Foundation


public struct LoginResponse {
    public let accessToken : String
    public let token : Token
    public let userId : String
    public let username : String
}


extension LoginResponse : Serializable {

    public init?(from json : JSONDictionary) {
        guard
            let accessToken = json["access_token"] as? String,
            let t = json["token"] as? [String : Any],
            let token = Token(from: t),
            let userId = json["user_id"] as? String,
            let username = json["username"] as? String
            else { return nil }

        self.accessToken = accessToken
        self.token = token
        self.userId = userId
        self.username = username
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            :
        ]

        return dict
    }
    
}
