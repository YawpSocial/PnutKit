//
//  Raw.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Raw {
    public var type : String
    public var value : [String : Any]

    public init(type : String, value : [String : Any]) {
        self.type = type
        self.value = value
    }
}


extension Raw {
    public init?(from dict : [String : Any]) {
        guard let type = dict["type"] as? String,
            let value = dict["value"] as? [String : Any]
            else { return nil }

        self.type = type
        self.value = value
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "type" : type,
            "value" : value,
            ]
        return dict
    }
}
