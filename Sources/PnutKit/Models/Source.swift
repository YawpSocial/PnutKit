import Foundation


public struct Source {
    public var name : String
    public var link : URL
    public var id : String
}


extension Source : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let name = dict["name"] as? String,
            let l = dict["link"] as? String,
            let link = URL(string: l),
            let id = dict["id"] as? String
            else { return nil }

        self.name = name
        self.link = link
        self.id = id
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "name" : name,
            "link" : link.absoluteString,
            "id" : id,
            ]
        return dict
    }

}
