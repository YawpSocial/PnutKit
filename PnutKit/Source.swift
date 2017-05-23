//
//  Source.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Source {
    public var name : String
    public var link : URL
    public var id : String
}


extension Source {
    public init?(from dict : [String : Any]) {
        guard let name = dict["name"] as? String,
            let l = dict["link"] as? String,
            let link = URL(string: l),
            let id = dict["id"] as? String
            else { return nil }

        self.name = name
        self.link = link
        self.id = id
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "name" : name,
            "link" : link.absoluteString,
            "id" : id,
            ]
        return dict
    }
}
