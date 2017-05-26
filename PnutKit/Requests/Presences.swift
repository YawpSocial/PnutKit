import Foundation


public struct Presences {

    public static func get() -> Request<[Presence]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<[Presence]>(path: "/presence", method: method, parse: Request<[Presence]>.parser)
    }

    public static func set(userId : String, presence : String) -> Request<Presence> {
        let parameters = [
            Parameter(name: "presence", value: presence),
            ]
        let method = HTTPMethod.put(Payload.parameters(parameters))

        return Request<Presence>(path: "/users/\(userId)/presence", method: method, parse: Request<Presence>.parser)
    }
}
