import Foundation


struct PnutError {
    /// Reason why Pnut.io returned an error.
    let description : String
}

extension PnutError {

    init(json : JSONObject) {
        let dictionary = json as? JSONDictionary
        self.description = dictionary?["error"].flatMap(asString) ?? ""
    }

}
