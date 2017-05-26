import Foundation


public struct Presence {
    public let id : String
    public let presence : String
    public let lastSeenAt : Date
}


extension Presence : Serializable {

    public init?(from json : JSONDictionary) {
        guard let id = json["id"] as? String,
            let presence = json["presence"] as? String,
            let d = json["last_seen_at"] as? String,
            let lastSeenAt = ISO8601DateFormatter().date(from: d)
            else { return nil }

        self.id = id
        self.presence = presence
        self.lastSeenAt = lastSeenAt
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "id" : id,
            "presence" : presence,
            "last_seen_at" : ISO8601DateFormatter().string(from: lastSeenAt),
            ]
        
        return dict
    }
    
}
