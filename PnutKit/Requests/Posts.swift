import Foundation


public struct Posts {

    /// Retrieves mentions for a specified user.
    ///
    /// - Parameter range: The bounds used when requesting data from Pnut.io.
    /// - Returns: Request for `[Post]`.
    public static func mentions(userId : String, range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/users/\(userId)/mentions", method: method, parse: Request<[Post]>.parser)
    }

    /// Retrieves posts by a specified user.
    ///
    /// - Parameter range: The bounds used when requesting data from Pnut.io.
    /// - Returns: Request for `[Post]`.
    public static func posts(userId : String, range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/users/\(userId)/posts", method: method, parse: Request<[Post]>.parser)
    }

    /// Retrieves posts by a specified user.
    ///
    /// - Parameter range: The bounds used when requesting data from Pnut.io.
    /// - Returns: Request for `[Post]`.
    public static func tagged(tag : String, range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/posts/tag/\(tag)", method: method, parse: Request<[Post]>.parser)
    }

}
