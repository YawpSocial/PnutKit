//
//  Stream.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Stream {

    public var id : String
    public var objectTypes : [String]
    public var type : StreamType
    public var key : String
    public var endpoint : URL

    //    public static var supportsSecureCoding: Bool {
    //        return true
    //    }
    //
    //    public init?(coder aDecoder : NSCoder) {
    //self.id = aDecoder.decodeObject(of: [NSString.self], forKey: "id")
    //        self.objectTypes = aDecoder.decodeObject(of: [NSArray.self], forKey: "objectTypes")
    //        self.type = StreamType(rawValue: aDecoder.decodeObject(of: [NSString.self], forKey: "type"))
    //        self.key = aDecoder.decodeObject(of: [NSString.self], forKey: "key")
    //        self.endpoint = URL(string: aDecoder.decodeObject(of: [NSString.self], forKey: "endpoint"))
    //    }
    //
    //    public init(id : String, objectTypes : [String], type : StreamType, key : String, endpoint : URL) {
    //        self.id = id
    //        self.objectTypes = objectTypes
    //        self.type = type
    //        self.key = key
    //        self.endpoint = endpoint
    //    }
}


public enum StreamType : String {
    case longPoll = "long_poll"
}


extension Stream {
    public init?(from dict : [String : Any]) {
        guard let id = dict["id"] as? String,
            let objectTypes = dict["object_types"] as? [String],
            let t = dict["type"] as? String,
            let type = StreamType(rawValue: t),
            let key = dict["key"] as? String,
            let url = dict["endpoint"] as? String,
            let endpoint = URL(string: url)
            else { return nil }

        self.id = id
        self.objectTypes = objectTypes
        self.type = type
        self.key = key
        self.endpoint = endpoint
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "id" : id,
            "object_types" : objectTypes,
            "type" : type.rawValue,
            "key" : key,
            "endpoint" : endpoint.absoluteString,
            ]
        return dict
    }
}
