import Foundation


public typealias JSONObject = Any
public typealias JSONDictionary = [String : JSONObject]

extension Request where Model : Serializable {

    static func parser(json : JSONObject) -> Model? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        guard let meta = dictionary["meta"] as? JSONDictionary else { return nil }
        guard let code = meta["code"] as? Int, code == 200 else { return nil }
        guard let data = dictionary["data"] as? JSONDictionary else { return nil }
        return Model(from: data)
    }

}

extension Request where Model : Sequence, Model.Iterator.Element : Serializable {

    static func parser(json : JSONObject) -> [Model.Iterator.Element] {
        guard let dictionary = json as? JSONDictionary else { return [] }
        guard let meta = dictionary["meta"] as? JSONDictionary else { return [] }
        guard let code = meta["code"] as? Int, code == 200 else { return [] }
        guard let array = dictionary["data"] as? [JSONDictionary] else { return [] }
        return array.flatMap(Model.Iterator.Element.init)
    }

}
