import Foundation
import SwiftData

/// A class representing a meeting.
@Model
class Meeting {
    let id: String
    let roomId: String
    let title: String
    let starts: Date
    let ends: Date
    
    init(roomId: String, title: String, starts: Date, ends: Date) {
        self.id = UUID().uuidString
        self.roomId = roomId
        self.title = title
        self.starts = starts
        self.ends = ends
    }
}
