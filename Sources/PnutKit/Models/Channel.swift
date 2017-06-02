import Foundation


private let dateFormatter = ISO8601DateFormatter()

public struct Channel {
    public var createdAt : Date
    public var id : String
    public var isActive : Bool
    public var type : String
    public var owner : User
    public var recentMessageId : String?
    public var recentMessage : Message?
    public var acl : ACL
    public var counts : Counts
    public var youSubscribed : Bool
    public var youMuted : Bool
    public var hasUnread : Bool

    public struct Counts {
        public var messages : Int
        public var subscribers : Int
    }
}


extension Channel : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let createdAtStr = dict["created_at"] as? String,
            let createdAt = dateFormatter.date(from: createdAtStr),
            let id = dict["id"] as? String,
            let type = dict["type"] as? String,
            let aclDict = dict["acl"] as? [String : Any],
            let acl = ACL(from: aclDict),
            let counts = dict["counts"] as? [String : Int],
            let messagesCount = counts["messages"],
            let subscribersCount = counts["subscribers"],
            let youSubscribed = dict["you_subscribed"] as? Bool,
            let youMuted = dict["you_muted"] as? Bool,
            let hasUnread = dict["has_unread"] as? Bool
            else { return nil }

        self.createdAt = createdAt
        self.id = id
        self.isActive = dict["is_active"] as? Bool ?? false
        self.type = type
        self.owner = User(from: dict["owner"] as? [String: Any] ?? [:]) ?? .deleted
        self.recentMessageId = dict["recent_message_id"] as? String
        self.recentMessage = Message(from: dict["recent_message"] as? [String : Any] ?? [:])
        self.acl = acl
        self.counts = Counts(messages: messagesCount,
                             subscribers: subscribersCount)
        self.youSubscribed = youSubscribed
        self.youMuted = youMuted
        self.hasUnread = hasUnread
    }

    public func toDictionary() -> JSONDictionary {
        var dict : JSONDictionary = [
            "created_at" : dateFormatter.string(from: createdAt),
            "id" : id,
            "is_active" : isActive,
            "type" : type,
            "owner" : owner.toDictionary(),
            "acl" : acl.toDictionary(),
            "counts" : [
                "messages" : counts.messages,
                "subscribers" : counts.subscribers,
            ],
            "you_subscribed" : youSubscribed,
            "you_muted" : youMuted,
            "has_unread" : hasUnread,
            ]

        if let recentMessageId = recentMessageId {
            dict["recent_message_id"] = recentMessageId
        }
        if let recentMessage = recentMessage {
            dict["recent_message"] = recentMessage.toDictionary()
        }

        return dict
    }
    
}
