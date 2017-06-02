import Foundation


public typealias JSONObject = Any
public typealias JSONDictionary = [String : JSONObject]

extension Request where Model : Serializable {

    static func parser(json : JSONObject) -> Model? {
        guard let dictionary = json as? JSONDictionary else { return nil }

        // if there's a meta key, then extract the model data from the peer data key
        if let meta = dictionary["meta"] as? JSONDictionary {
            guard let code = meta["code"] as? Int, 200...299 ~= code else { return nil }
            guard let data = dictionary["data"] as? JSONDictionary else { return nil }

            return Model(from: data)
        }

        // there wasn't a meta key, so just parse the entire dictionary as model data
        return Model(from: dictionary)
    }

}

extension Request where Model : Sequence, Model.Iterator.Element : Serializable {

    static func parser(json : JSONObject) -> [Model.Iterator.Element] {
        // if there's a meta key, then extract the model array from the peer data key
        if let dictionary = json as? JSONDictionary,
            let meta = dictionary["meta"] as? JSONDictionary {
            guard let code = meta["code"] as? Int, 200...299 ~= code else { return [] }
            guard let array = dictionary["data"] as? [JSONDictionary] else { return [] }
            return array.flatMap(Model.Iterator.Element.init)
        }

        // try to process the entire response as an array
        if let array = json as? [JSONDictionary] {
            return array.flatMap(Model.Iterator.Element.init)
        }
        
        return []
    }
    
}
