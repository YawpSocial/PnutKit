import Foundation


public enum AccessScope : String {
    /// see basic information about the user
    case basic = "basic"
    /// read the user's stream
    case stream = "stream"
    /// create a new post as the user
    case writePost = "write_post"
    /// add or remove follows, mutes, and blocks for the user
    case follow = "follow"
    /// update a user's name and other profile information
    case updateProfile = "update_profile"
    /// update user's presence
    case presence = "presence"
    /// all messages and channels
    case messages = "messages"
    /// only public channels and messages
    case publicMessages = "public_messages"
}
