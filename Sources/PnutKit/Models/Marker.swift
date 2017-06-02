import Foundation


public struct Marker {
    public let id : String
    public let lastReadId : String
    public let percentage : Int
    public let updatedAt : Date
    public let version : String
    public let name : String
}


extension Marker : Serializable {

    public init?(from json : JSONDictionary) {
        guard let id = json["id"] as? String,
            let lastReadId = json["last_read_id"] as? String,
            let percentage = json["percentage"] as? Int,
            let u = json["updated_at"] as? String,
            let updatedAt = ISO8601DateFormatter().date(from: u),
            let version = json["version"] as? String,
            let name = json["name"] as? String
            else { return nil }

        self.id = id
        self.lastReadId = lastReadId
        self.percentage = percentage
        self.updatedAt = updatedAt
        self.version = version
        self.name = name
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "id" : id,
            "last_read_id" : lastReadId,
            "percentage" : percentage,
            "updated_at" : ISO8601DateFormatter().string(from: updatedAt),
            "version" : version,
            "name" : name,
            ]

        return dict
    }
    
}
