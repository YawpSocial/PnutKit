//
//  Mention.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Mention {
    public var id : String
    public var len : Int
    public var pos : Int
    public var text : String
    public var isLeading : Bool
    public var isCopy : Bool
}


extension Mention : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let id = dict["id"] as? String,
            let len = dict["len"] as? Int,
            let pos = dict["pos"] as? Int,
            let text = dict["text"] as? String
            else { return nil }

        self.id = id
        self.len = len
        self.pos = pos
        self.text = text
        self.isLeading = dict["is_leading"] as? Bool ?? false
        self.isCopy = dict["is_copy"] as? Bool ?? false
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "id" : id,
            "len" : len,
            "pos" : pos,
            "text" : text,
            "is_leading" : isLeading,
            "is_copy" : isCopy,
            ]
        return dict
    }

}
