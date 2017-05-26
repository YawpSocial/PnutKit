import Foundation


enum Payload {
    case parameters([Parameter]?)
    case empty
}

extension Payload {

    var items: [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toQueryItem)
        case .empty: return nil
        }
    }

    var data: Data? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toString).joined(separator: "&").data(using: .utf8)
        case .empty: return nil
        }
    }

    var type: String? {
        switch self {
        case .parameters(let parameters): return parameters.flatMap { _ in "application/x-www-form-urlencoded; charset=utf-8" }
        case .empty: return nil
        }
    }

}
