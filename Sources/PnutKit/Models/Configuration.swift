//
//  Configuration.swift
//  Yawp
//
//  Created by Paul Schifferer on 4/4/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Configuration {

    public var message : Message = Message()
    public var post : Post = Post()
    public var rateLimit : RateLimit = RateLimit()
    public var user : User = User()

    public struct Message {
        public var maxLength : Int = 2048
    }
    public struct Post {
        public var maxLength : Int = 256
        public var repostMaxLength : Int = 256
        public var secondsBetweenDuplicates : TimeInterval = 120
    }
    public struct RateLimit {
        public struct Anonymous {
            public var reads : Int = 40
            public var secondsBetweenReset : TimeInterval = 60
        }
        public struct Authorized {
            public var reads : Int = 5000
            public var readResetSeconds : TimeInterval = 3600
            public var writes : Int = 20
            public var writeResetSeconds : TimeInterval = 60
        }

        public var anonymous : Anonymous = Anonymous()
        public var authorized : Authorized = Authorized()
        public var secondsBanned : TimeInterval = 600
    }
    public struct User {
        public var descriptionMaxLength : Int = 256
        public var usernameMaxLength : Int = 50
    }

    public init() {

    }
}


extension Configuration : Serializable {

    public init?(from dict : JSONDictionary) {
        if let message = dict["message"] as? [String : Any] {
            if let value = message["max_length"] as? Int {
                self.message.maxLength = value
            }
        }

        if let post = dict["post"] as? [String : Any] {
            if let value = post["max_length"] as? Int {
                self.post.maxLength = value
            }
            if let value = post["repost_max_length"] as? Int {
                self.post.repostMaxLength = value
            }
            if let value = post["seconds_between_duplicates"] as? Int {
                self.post.secondsBetweenDuplicates = TimeInterval(value)
            }
        }

        if let rateLimit = dict["rate_limit"] as? [String : Any] {
            if let anon = rateLimit["anonymous"] as? [String : Any] {
                if let value = anon["reads"] as? Int {
                    self.rateLimit.anonymous.reads = value
                }
                if let value = anon["seconds_between_reset"] as? Int {
                    self.rateLimit.anonymous.secondsBetweenReset = TimeInterval(value)
                }
            }
            if let auth = rateLimit["authorized"] as? [String : Any] {
                if let value = auth["reads"] as? Int {
                    self.rateLimit.authorized.reads = value
                }
                if let value = auth["read_reset_seconds"] as? Int {
                    self.rateLimit.authorized.readResetSeconds = TimeInterval(value)
                }
                if let value = auth["writes"] as? Int {
                    self.rateLimit.authorized.writes = value
                }
                if let value = auth["write_reset_seconds"] as? Int {
                    self.rateLimit.authorized.writeResetSeconds = TimeInterval(value)
                }
            }
            if let value = rateLimit["seconds_banned"] as? Int {
                self.rateLimit.secondsBanned = TimeInterval(value)
            }
        }

        if let user = dict["user"] as? [String : Any] {
            if let value = user["description_max_length"] as? Int {
                self.user.descriptionMaxLength = value
            }
            if let value = user["username_max_length"] as? Int {
                self.user.usernameMaxLength = value
            }
        }
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "message" : [
                "max_length" : message.maxLength,
            ],
            "post" : [
                "max_length" : self.post.maxLength,
                "repost_max_length" : self.post.repostMaxLength,
                "seconds_between_duplicates" : self.post.secondsBetweenDuplicates,
            ],
            "rate_limit" : [
                "anonymous" : [
                    "reads" : self.rateLimit.anonymous.reads,
                    "seconds_between_reset" : self.rateLimit.anonymous.secondsBetweenReset,
                ],
                "authorized" : [
                    "reads" : self.rateLimit.authorized.reads,
                    "read_reset_seconds" : self.rateLimit.authorized.readResetSeconds,
                    "writes" : self.rateLimit.authorized.writes,
                    "write_reset_seconds" : self.rateLimit.authorized.writeResetSeconds,
                ],
                "seconds_banned" : self.rateLimit.secondsBanned,
            ],
            "user" : [
                "description_max_length" : user.descriptionMaxLength,
                "username_max_length" : user.usernameMaxLength,
            ]
        ]
        return dict
    }
    
}
