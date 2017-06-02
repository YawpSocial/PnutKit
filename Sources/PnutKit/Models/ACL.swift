import Foundation


public struct ACL {
    public struct Full {
        public var immutable : Bool = false
        public var you : Bool = false
        public var userIds : [String] = []
    }
    public struct Write {
        public var anyUser : Bool = false
        public var immutable : Bool = false
        public var you : Bool = false
        public var userIds : [String] = []
    }
    public struct Read {
        public var anyUser : Bool = false
        public var immutable : Bool = false
        public var `public` : Bool = false
        public var you : Bool = false
        public var userIds : [String] = []
    }

    public var full = Full()
    public var write = Write()
    public var read = Read()
}


extension ACL : Serializable {

    public init?(from dict : JSONDictionary) {
        guard let full = dict["full"] as? [String : Any],
            let write = dict["write"] as? [String : Any],
            let read = dict["read"] as? [String : Any],
            let fullImmutable = full["immutable"] as? Bool,
            let fullYou = full["you"] as? Bool,
            let fullUserIds = full["user_ids"] as? [String],
            let writeAnyUser = write["any_user"] as? Bool,
            let writeImmutable = write["immutable"] as? Bool,
            let writeYou = write["you"] as? Bool,
            let writeUserIds = write["user_ids"] as? [String],
            let readAnyUser = read["any_user"] as? Bool,
            let readImmutable = read["immutable"] as? Bool,
            let readPublic = read["public"] as? Bool,
            let readYou = read["you"] as? Bool,
            let readUserIds = read["user_ids"] as? [String]
            else { return nil }

        self.full.immutable = fullImmutable
        self.full.you = fullYou
        self.full.userIds = fullUserIds

        self.write.anyUser = writeAnyUser
        self.write.immutable = writeImmutable
        self.write.you = writeYou
        self.write.userIds = writeUserIds

        self.read.anyUser = readAnyUser
        self.read.immutable = readImmutable
        self.read.public = readPublic
        self.read.you = readYou
        self.read.userIds = readUserIds
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "full" : [
                "immutable" : full.immutable,
                "you" : full.you,
                "user_ids" : full.userIds,
            ],
            "write" : [
                "any_user" : write.anyUser,
                "immutable" : write.immutable,
                "you" : write.you,
                "user_ids" : write.userIds,
            ],
            "read" : [
                "any_user" : read.anyUser,
                "immutable" : read.immutable,
                "public" : read.public,
                "you" : read.you,
                "user_ids" : read.userIds,
            ]
        ]
        return dict
    }
    
}
