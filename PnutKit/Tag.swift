//
//  Tag.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Tag {
    public var len : Int
    public var pos : Int
    public var text : String
}


extension Tag {
    public init?(from dict : [String : Any]) {
        guard let len = dict["len"] as? Int,
            let pos = dict["pos"] as? Int,
            let text = dict["text"] as? String
            else { return nil }

        self.len = len
        self.pos = pos
        self.text = text
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "len" : len,
            "pos" : pos,
            "text" : text,
            ]
        return dict
    }
}
