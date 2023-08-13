import SwiftUI
import SwiftData

/// A view model for managing meeting details.
@Observable class MeetingDetailViewModel {
    /// The title of the meeting.
    var title = ""
    /// State variable to hold the meeting start time.
    var starts: Date = .now
    /// State variable to hold the meeting end time.
    var ends: Date = .now
    /// State variable to control the presentation of a sheet.
    var showSheet: Bool = false
    
    let roomID: String
    let roomName: String
    
    /// Initializes a new MeetingDetailViewModel instance.
    /// - Parameters:
    ///   - roomID: The ID of the room associated with the meeting.
    ///   - roomName: The name of the room associated with the meeting.
    init(roomID: String, roomName: String) {
        self.roomID = roomID
        self.roomName = roomName
    }
    
    /// Adds a new meeting to the model context.
    /// - Parameter modelContext: The ModelContext to insert the meeting into.
    func add(to modelContext: ModelContext) {
        let meeting: Meeting = .init(roomId: roomID, title: title, starts: starts, ends: ends)
        modelContext.insert(meeting)
        
        // Resetting state variables.
        showSheet = false
        title = ""
    }
}
