//
//  Explore.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Explore {
    public var desc : String
    public var link : URL
    public var slug : String
    public var title : String
}


extension Explore : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let desc = dict["description"] as? String,
            let l = dict["link"] as? String,
            let link = URL(string: l),
            let slug = dict["slug"] as? String,
            let title = dict["title"] as? String
            else { return nil }

        self.desc = desc
        self.link = link
        self.slug = slug
        self.title = title
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "description" : desc,
            "link" : link.absoluteString,
            "slug" : slug,
            "title" : title,
            ]
        return dict
    }
    
}
