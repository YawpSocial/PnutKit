import Foundation


public typealias StreamRequest = Request<[Post]>
public typealias ExploreRequest = Request<[Explore]>

public struct Streams {

    /**
     Retrieves the user timeline.

     - parameter range: The bounds used when requesting data from Pnut.io.
     - returns: Request for `[Post]`.
     */
    public static func me(range: RequestRange = .default) -> Request<[Post]> {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[Post]>(path: "/posts/streams/me", method: method, parse: Request<[Post]>.parser)
    }

    /**
     Retrieves the unified user timeline.

     - parameter range: The bounds used when requesting data from Pnut.io.
     - returns: Request for `[Post]`.
     */
    public static func unified(raw : Bool = false, range: RequestRange = .default) -> Request<[Post]> {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[Post]>(path: "/posts/streams/unified", method: method, parse: Request<[Post]>.parser)
    }

    /**
     Retrieves the global timeline.

     - parameter range: The bounds used when requesting data from Pnut.io.
     - returns: Request for `[Post]`.
     */
    public static func global(range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/posts/streams/global", method: method, parse: Request<[Post]>.parser)
    }

    /**
     Returns the explore objects available.

     - returns: An array of `Explore` objects.
     */
    public static func explore() -> Request<[Explore]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[Explore]>(path: "/posts/streams/explore", method: method, parse: Request<[Explore]>.parser)
    }

    /**
     Return posts for the specified explore stream.

     - parameter slug: The slug to explore
     - returns: An array of posts in the stream.
     */
    public static func explore(slug : String) -> Request<[Post]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[Post]>(path: "/posts/streams/explore/\(slug)", method: method, parse: Request<[Post]>.parser)
    }
    
}
