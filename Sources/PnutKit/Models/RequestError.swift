import Foundation


struct ServiceError {
    /// Reason why Pnut.io returned an error.
    let description : String
}

extension ServiceError {

    init(json : JSONObject) {
        let dictionary = json as? JSONDictionary
        self.description = dictionary?["error"].flatMap(asString) ?? ""
    }

}
