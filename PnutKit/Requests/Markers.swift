import Foundation


public struct Markers {

    /**
     Update markers.
     
     - parameter markers: An array of tuples (name, id) for each marker to update.
     - returns: The updated markers.
     */
    public static func update(markers : [(String, String)]) throws -> Request<[Marker]> {
        let json : [JSONDictionary] = markers.map { return [ "name" : $0.0, "id" : $0.1 ] }
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        let method = HTTPMethod.post(Payload.json(data))

        return Request<[Marker]>(path: "/markers", method: method, parse: Request<[Marker]>.parser)
    }
    
}
