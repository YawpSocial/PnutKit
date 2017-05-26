import Foundation


public struct Authentication {

    /// Performs a silent login.
    ///
    /// - Parameters:
    ///   - clientID: The client ID.
    ///   - clientSecret: The client secret.
    ///   - scopes: The access scopes.
    ///   - username: The user's username or e-mail address.
    ///   - password: The user's password.
    /// - Returns: Request for `LoginSettings`.
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

    public static func logout() -> Request<Token> {
        let method = HTTPMethod.delete
        return Request<Token>(path: "/token", method: method, parse: Request<Token>.parser)
    }

}
