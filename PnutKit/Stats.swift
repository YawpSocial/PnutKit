//
//  Stats.swift
//  Yawp
//
//  Created by Paul Schifferer on 19/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Stats {
    public var clientsCreated : Int
    public var days : Int
    public var postsCreated : Int
    public var messagesCreated : Int
    public var usersCreated : Int
    public var usersDisabled : Int
    public var usersPresent : Int
}


extension Stats {
    public init?(from dict : [String : Any]) {
        guard let counts = dict["counts"] as? [String : Any],
            let clients = counts["clients"] as? [String : Any],
            let clientsCreated = clients["created"] as? Int,
            let days = counts["days"] as? Int,
            let posts = counts["posts"] as? [String : Any],
            let postsCreated = posts["created"] as? Int,
            let messages = counts["messages"] as? [String : Any],
            let messagesCreated = messages["created"] as? Int,
            let users = counts["users"] as? [String : Any],
            let usersCreated = users["created"] as? Int,
            let usersDisabled = users["disabled"] as? Int,
            let usersPresent = users["present"] as? Int
            else { return nil }

        self.clientsCreated = clientsCreated
        self.days = days
        self.postsCreated = postsCreated
        self.messagesCreated = messagesCreated
        self.usersCreated = usersCreated
        self.usersDisabled = usersDisabled
        self.usersPresent = usersPresent
    }

    public func toDictionary() -> NSDictionary {
        let dict : NSDictionary = [
            "counts" : [
                "clients" : [
                    "created" : clientsCreated,
                ],
                "days" : days,
                "posts" : [
                    "created" : postsCreated,
                ],
                "messages" : [
                    "created" : messagesCreated,
                ],
                "users" : [
                    "created" : usersCreated,
                    "disabled" : usersDisabled,
                    "present" : usersPresent,
                ]
            ]
        ]
        return dict
    }
}
