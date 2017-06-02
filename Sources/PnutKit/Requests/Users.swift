import Foundation


public struct Users {

    public static func get(userId : String) -> Request<User> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<User>(path: "/users/\(userId)", method: method, parse: Request<User>.parser)
    }

    public static func get(userIds : [String]) -> Request<[User]> {
        let parameters = [
            Parameter(name: "ids", value: userIds.joined(separator: ","))
        ]
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[User]>(path: "/users", method: method, parse: Request<[User]>.parser)
    }

//    public static func authorized() -> Request<[User]> {
//
//    }

    public static func tokens() -> Request<[Token]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[Token]>(path: "/apps/me/users/tokens", method: method, parse: Request<[Token]>.parser)
    }

    public static func clients(userId : String) -> Request<[Client]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[Client]>(path: "/users/\(userId)/clients", method: method, parse: Request<[Client]>.parser)
    }

//    public static func actions() -> Request<[Action]> {
//
//    }

    public static func bookmarks(userId : String) -> Request<[Post]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[Post]>(path: "/users/\(userId)/bookmarks", method: method, parse: Request<[Post]>.parser)
    }

    public static func blocked(userId : String) -> Request<[User]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[User]>(path: "/users/\(userId)/blocked", method: method, parse: Request<[User]>.parser)
    }

    public static func block(userId : String) -> Request<User> {
        let method = HTTPMethod.put(Payload.empty)

        return Request<User>(path: "/users/\(userId)/block", method: method, parse: Request<User>.parser)
    }

    public static func unblock(userId : String) -> Request<User> {
        let method = HTTPMethod.delete

        return Request<User>(path: "/users/\(userId)/block", method: method, parse: Request<User>.parser)
    }

    public static func muted(userId : String) -> Request<[User]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[User]>(path: "/users/\(userId)/muted", method: method, parse: Request<[User]>.parser)
    }

    public static func mute(userId : String) -> Request<User> {
        let method = HTTPMethod.put(Payload.empty)

        return Request<User>(path: "/users/\(userId)/mute", method: method, parse: Request<User>.parser)
    }

    public static func unmute(userId : String) -> Request<User> {
        let method = HTTPMethod.delete

        return Request<User>(path: "/users/\(userId)/mute", method: method, parse: Request<User>.parser)
    }

    public static func followers(userId : String) -> Request<[User]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[User]>(path: "/users/\(userId)/followers", method: method, parse: Request<[User]>.parser)
    }

    public static func following(userId : String) -> Request<[User]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[User]>(path: "/users/\(userId)/following", method: method, parse: Request<[User]>.parser)
    }

    public static func follow(userId : String) -> Request<User> {
        let method = HTTPMethod.put(Payload.empty)

        return Request<User>(path: "/users/\(userId)/follow", method: method, parse: Request<User>.parser)
    }
    
    public static func unfollow(userId : String) -> Request<User> {
        let method = HTTPMethod.delete

        return Request<User>(path: "/users/\(userId)/follow", method: method, parse: Request<User>.parser)
    }
    
    public static func presence(userId : String) -> Request<Presence> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<Presence>(path: "/users/\(userId)/presence", method: method, parse: Request<Presence>.parser)
    }
    
}
