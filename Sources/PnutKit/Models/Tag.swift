import Foundation


public struct Tag {
    public var len : Int
    public var pos : Int
    public var text : String
}


extension Tag : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let len = dict["len"] as? Int,
            let pos = dict["pos"] as? Int,
            let text = dict["text"] as? String
            else { return nil }

        self.len = len
        self.pos = pos
        self.text = text
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "len" : len,
            "pos" : pos,
            "text" : text,
            ]
        return dict
    }

}
