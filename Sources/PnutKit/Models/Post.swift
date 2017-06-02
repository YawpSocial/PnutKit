import Foundation


#if os(iOS) || os(macOS)
    private let dateFormatter = ISO8601DateFormatter()
#else
    private let dateFormatter = DateFormatter()
#endif

public struct Post {
    public var createdAt : Date
    public var guid : String
    public var id : String
    public var isDeleted : Bool
    public var isNSFW : Bool
    public var source : Source
    public var user : User?
    public var threadId : String
    public var replyTo : String?
    public var repostOf : Indirect<Post>?
    public struct Counts {
        public var bookmarks : Int = 0
        public var replies : Int = 0
        public var reposts : Int = 0
        public var threads : Int = 0
    }
    public var counts = Counts()
    public var content : Content?
    public var youBookmarked : Bool?
    public var youReposted : Bool?
    public var raw : [Raw]
}


extension Post : Serializable {

    public init?(from dict : JSONDictionary) {
        guard let c = dict["created_at"] as? String,
            let createdAt = dateFormatter.date(from: c),
            let guid = dict["guid"] as? String,
            let id = dict["id"] as? String,
            let s = dict["source"] as? [String : String],
            let source = Source(from: s),
            let threadId = dict["thread_id"] as? String,
            let counts = dict["counts"] as? [String : Int]
            else { return nil }

        self.createdAt = createdAt
        self.guid = guid
        self.id = id
        self.isDeleted = dict["is_deleted"] as? Bool ?? false
        self.isNSFW = dict["is_nsfw"] as? Bool ?? false
        self.source = source
        self.user = User(from: (dict["user"] as? [String : Any] ?? [:])) ?? .deleted
        self.threadId = threadId
        self.replyTo = dict["reply_to"] as? String
        if let repostOf = dict["repost_of"] as? [String : Any],
            let repost = Post(from: repostOf) {
            self.repostOf = Indirect(repost)
        }
        self.counts.bookmarks = counts["bookmarks"] ?? 0
        self.counts.replies = counts["replies"] ?? 0
        self.counts.reposts = counts["reposts"] ?? 0
        self.counts.threads = counts["threads"] ?? 0
        self.content = Content(from: dict["content"] as? [String : Any] ?? [:])
        self.youBookmarked = dict["you_bookmarked"] as? Bool
        self.youReposted = dict["you_reposted"] as? Bool

        if let raw = dict["raw"] as? [[String : Any]] {
            self.raw = raw.flatMap { Raw(from: $0) }
        }
        else {
            self.raw = []
        }
    }

    public func toDictionary() -> JSONDictionary {
        var dict : JSONDictionary = [
            "created_at" : dateFormatter.string(from: createdAt),
            "guid" : guid,
            "id" : id,
            "is_deleted" : isDeleted,
            "is_nsfw" : isNSFW,
            "source" : source.toDictionary(),
            "counts" : [
                "bookmarks" : counts.bookmarks,
                "replies" : counts.replies,
                "reposts" : counts.reposts,
                "threads" : counts.threads,
            ],
            ]

        if let user = user {
            dict["user"] = user.toDictionary()
        }

        if let replyTo = replyTo {
            dict["reply_to"] = replyTo
        }

        if let repostOf = repostOf {
            dict["repost_of"] = repostOf.value.toDictionary()
        }

        if let content = content {
            dict["content"] = content.toDictionary()
        }

        if let youBookmarked = youBookmarked {
            dict["you_bookmarked"] = youBookmarked
        }

        if let youReposted = youReposted {
            dict["you_reposted"] = youReposted
        }
        
        return dict
    }
    
}
