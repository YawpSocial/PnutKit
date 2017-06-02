//
//  Image.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Image {
    public var link : URL
    public var isDefault : Bool
    public var width : Int
    public var height : Int
}


extension Image : Serializable {

    public init?(from dict : JSONDictionary) {
        guard let l = dict["link"] as? String,
            let link = URL(string: l),
            let width = dict["width"] as? Int,
            let height = dict["height"] as? Int
            else { return nil }

        self.link = link
        self.isDefault = dict["is_default"] as? Bool ?? false
        self.width = width
        self.height = height
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "link" : link.absoluteString,
            "width" : width,
            "height" : height,
            ]
        return dict
    }
    
}
