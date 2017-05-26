import Foundation


public struct Raw {
    public var type : String
    public var value : [String : Any]

    public init(type : String, value : [String : Any]) {
        self.type = type
        self.value = value
    }
}


extension Raw : Serializable {

    public init?(from dict : JSONDictionary) {
        guard let type = dict["type"] as? String,
            let value = dict["value"] as? [String : Any]
            else { return nil }

        self.type = type
        self.value = value
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "type" : type,
            "value" : value,
            ]
        return dict
    }
    
}
