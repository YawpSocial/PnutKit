import Foundation


public struct Streams {

    /// Retrieves the user timeline.
    ///
    /// - Parameter range: The bounds used when requesting data from Pnut.io.
    /// - Returns: Request for `[Post]`.
    public static func me(range: RequestRange = .default) -> Request<[Post]> {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[Post]>(path: "/posts/streams/me", method: method, parse: Request<[Post]>.parser)
    }

    /// Retrieves the unified user timeline.
    ///
    /// - Parameter range: The bounds used when requesting data from Pnut.io.
    /// - Returns: Request for `[Post]`.
    public static func unified(range: RequestRange = .default) -> Request<[Post]> {
        let parameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<[Post]>(path: "/posts/streams/unified", method: method, parse: Request<[Post]>.parser)
    }

    /// Retrieves the global timeline.
    ///
    /// - Parameter range: The bounds used when requesting data from Pnut.io.
    /// - Returns: Request for `[Post]`.
    public static func global(range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/posts/streams/global", method: method, parse: Request<[Post]>.parser)
    }

}
