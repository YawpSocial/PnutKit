import Foundation


public enum ClientError : Error {
    /// Failed to build the URL to make the request.
    case malformedURL
    /// The service returned an error.
    case serviceError(String)
    /// Failed to parse the response from Pnut.io.
    case dataError(Data?)
    /// The server response was invalid
    case invalidResponse(URLResponse?)
}
