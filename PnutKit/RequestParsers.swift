import Foundation


public typealias JSONObject = Any
public typealias JSONDictionary = [String : JSONObject]

extension Request where Model : Serializable {

    static func parser(json : JSONObject) -> Model? {
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Model(from: dictionary)
    }

}

extension Request where Model : Sequence, Model.Iterator.Element : Serializable {

    static func parser(json : JSONObject) -> [Model.Iterator.Element] {
        guard let array = json as? [JSONDictionary] else { return [] }
        return array.flatMap(Model.Iterator.Element.init)
    }

}
