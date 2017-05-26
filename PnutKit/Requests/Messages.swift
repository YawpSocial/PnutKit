import Foundation


public struct Messages {

    public static func delete(channelId : String, messageId : String) -> Request<Message> {
        let method = HTTPMethod.delete

        return Request<Message>(path: "/channels/\(channelId)/messages/\(messageId)", method: method, parse: Request<Message>.parser)
    }
    
}
