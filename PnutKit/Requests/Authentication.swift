import Foundation


public struct Authentication {

    /**
     Logs the user in using the password grant method.

        - parameter clientID: The client ID.
        - parameter grantSecret: The password grant secret.
        - parameter scopes: The access scopes.
        - parameter username: The user's username.
        - parameter password: The user's password.
      - returns: Request for `LoginResponse`.
     */
    public static func login(clientID: String, grantSecret: String, scopes: [AccessScope], username: String, password: String) -> Request<LoginResponse> {
        let parameters = [
            Parameter(name: "client_id", value: clientID),
            Parameter(name: "password_grant_secret", value: grantSecret),
            Parameter(name: "scope", value: scopes.map(toString).joined(separator: " ")),
            Parameter(name: "grant_type", value: "password"),
            Parameter(name: "username", value: username),
            Parameter(name: "password", value: password)
        ]

        let method = HTTPMethod.post(Payload.parameters(parameters))
        return Request<LoginResponse>(path: "/oauth/access_token", method: method, parse: Request<LoginResponse>.parser)
    }

    /**
     Returns the token object associated with the access token provided.
     */
    public static func token() -> Request<Token> {
        let method = HTTPMethod.get(Payload.empty)
        return Request<Token>(path: "/token", method: method, parse: Request<Token>.parser)
    }

    /**
     Logs the user out.
     */
    public static func logout() -> Request<Token> {
        let method = HTTPMethod.delete
        return Request<Token>(path: "/token", method: method, parse: Request<Token>.parser)
    }
    
}
