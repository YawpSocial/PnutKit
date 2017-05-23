//
//  Content.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Content {
    public var text : String
    public var html : String
    public var mentions : [Mention] = []
    public var links : [Link] = []
    public var tags : [Tag] = []
    public var avatarImage : Image?
    public var coverImage : Image?
    public var linksNotParsed : Bool?

    init(text : String, html : String) {
        self.text = text
        self.html = html
    }
}


extension Content {
    public init?(from dict : [String : Any]) {
        guard let text = dict["text"] as? String,
            let html = dict["html"] as? String
            else { return nil }

        self.text = text
        self.html = html

        if let entities = dict["entities"] as? [String : Any] {
            if let mentions = entities["mentions"] as? [[String : Any]] {
                self.mentions = mentions.flatMap(Mention.init)
            }
            if let links = entities["links"] as? [[String : Any]] {
                self.links = links.flatMap(Link.init)
            }
            if let tags = entities["tags"] as? [[String : Any]] {
                self.tags = tags.flatMap(Tag.init)
            }
        }

        if let avatarDict = dict["avatar_image"] as? [String : Any] {
            self.avatarImage = Image(from: avatarDict)
        }
        if let coverDict = dict["cover_image"] as? [String : Any] {
            self.coverImage = Image(from: coverDict)
        }

        self.linksNotParsed = dict["links_not_parsed"] as? Bool
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "text" : text,
            "html" : html,
            "entities" : [
                "mentions" : mentions.map { $0.toDictionary() },
                "links" : links.map { $0.toDictionary() },
                "tags" : tags.map { $0.toDictionary() },
            ]
        ]

        if let image = avatarImage {
            dict.setValue(image.toDictionary(), forKey: "avatar_image")
        }
        if let image = coverImage {
            dict.setValue(image.toDictionary(), forKey: "cover_image")
        }

        if let linksNotParsed = linksNotParsed {
            dict.setValue(linksNotParsed, forKey: "links_not_parsed")
        }
        
        return dict
    }
}
