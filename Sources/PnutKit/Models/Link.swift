//
//  Link.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Link {
    public var link : URL
    public var text : String
    public var len : Int
    public var pos : Int
    public var title : String?
    public var desc : String?
}


extension Link : Serializable {

    public init?(from dict : JSONDictionary) {
        guard let linkStr = dict["link"] as? String,
            let link = URL(string: linkStr),
            let text = dict["text"] as? String,
            let len = dict["len"] as? Int,
            let pos = dict["pos"] as? Int
            else { return nil }

        self.link = link
        self.text = text
        self.len = len
        self.pos = pos
        self.title = dict["title"] as? String
        self.desc = dict["description"] as? String
    }

    public func toDictionary() -> JSONDictionary {
        var dict : JSONDictionary = [
            "link" : link.absoluteString,
            "text" : text,
            "len" : len,
            "pos" : pos,
            ]

        if let title = title {
            dict["title"] = title
        }

        if let desc = desc {
            dict["desc"] = desc
        }

        return dict
    }

}
