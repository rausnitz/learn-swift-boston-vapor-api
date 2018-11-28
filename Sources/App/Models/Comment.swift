import FluentSQLite
import Vapor

/// A single comment.
final class Comment: Codable, SQLiteModel {
    /// The unique identifier for this `Comment`.
    var id: Int?

    /// The name of the person who made this `Comment`.
    let name: String
    
    /// The text of the `Comment`.
    let text: String

    /// Creates a new `Comment`.
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
}

/// Allows `Comment` to be used as a dynamic migration.
extension Comment: Migration { }

/// Allows `Comment` to be encoded to and decoded from HTTP messages.
extension Comment: Content { }
