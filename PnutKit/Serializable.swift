import Foundation


public protocol Serializable {

    init?(from json : JSONDictionary)

    func toDictionary() -> JSONDictionary

}
