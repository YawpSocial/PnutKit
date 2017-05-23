//
//  Token.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Token {
    public var appId : String
    public var appLink : URL
    public var appName : String
    public var scopes : [String]
    public var user : User
}


extension Token {
    public init?(from dict : [String : Any]) {
        guard let app = dict["app"] as? [String : Any],
            let appId = app["id"] as? String,
            let link = app["link"] as? String,
            let appLink = URL(string: link),
            let appName = app["name"] as? String,
            let scopes = dict["scopes"] as? [String],
            let user = User(from: dict["user"] as? [String : Any] ?? [:])
            else { return nil }

        self.appId = appId
        self.appLink = appLink
        self.appName = appName
        self.scopes = scopes
        self.user = user
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "app" : [
                "id" : appId,
                "link" : appLink.absoluteString,
                "name" : appName,
            ],
            "scopes" : scopes,
            "user" : user.toDictionary(),
            ]
        return dict
    }
}
