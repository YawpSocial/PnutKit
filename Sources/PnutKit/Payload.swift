import Foundation


enum Payload {
    case parameters([Parameter]?)
    case data(String?, Data?)
    case json(Data?)
    case empty
}

extension Payload {

    var items: [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toQueryItem)
        case .empty, .data, .json: return nil
        }
    }

    var data: Data? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toString).joined(separator: "&").data(using: .utf8)
        case .data(_, let data): return data
        case .json(let data): return data
        case .empty: return nil
        }
    }

    var type: String? {
        switch self {
        case .parameters(let parameters): return parameters.flatMap { _ in "application/x-www-form-urlencoded; charset=utf-8" }
        case .data(let type, _): return type
        case .json(_): return "application/json"
        case .empty: return nil
        }
    }
    
}
