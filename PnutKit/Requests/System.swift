import Foundation


public struct System {

    public static func config() -> Request<Configuration> {
let method = HTTPMethod.get(Payload.empty)

        return Request<Configuration>(path: "/sys/config", method: method, parse: Request<Configuration>.parser)
    }

    public static func stats() -> Request<Stats> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<Stats>(path: "/sys/stats", method: method, parse: Request<Stats>.parser)
    }
    
}
