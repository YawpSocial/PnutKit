import Foundation


public struct Clients {

    public static func clients(clientId : String) -> Request<Client> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<Client>(path: "/clients/\(clientId)", method: method, parse: Request<Client>.parser)
    }
    
}
