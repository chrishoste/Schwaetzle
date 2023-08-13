import SwiftUI
import SwiftData

/// A view model for managing meeting details.
@Observable class MeetingDetailListViewModel {
    /// The selected date for the meeting details.
    let date: Date
    /// The ID of the meeting room.
    let roomID: String
    /// The array of meetings.
    let meetings: [Meeting]
    
    /// The array of meetings filtered based on date and room.
    var filteredMeeting: [Meeting] {
        meetings.filter { filterMeetings($0) }
    }

    /// Initializes a new MeetingDetailListViewModel instance.
    /// - Parameters:
    ///   - date: The selected date for the meeting details.
    ///   - roomID: The ID of the meeting room.
    ///   - meetings: The array of meetings.
    init(date: Date, roomID: String, meetings: [Meeting]) {
        self.date = date
        self.roomID = roomID
        self.meetings = meetings
    }
    
    /// Filters meetings based on date and room.
    /// - Parameter meeting: The meeting to be filtered.
    /// - Returns: `true` if the meeting matches the date and room criteria, `false` otherwise.
    func filterMeetings(_ meeting: Meeting) -> Bool {
        let isSameDay = Calendar.current.isDate(date, equalTo: meeting.starts, toGranularity: .day)
        let isSameRoom = meeting.roomId == roomID
        
        return isSameDay && isSameRoom
    }
    
    /// Deletes meetings at the specified index set.
    /// - Parameters:
    ///   - at: The index set of meetings to be deleted.
    ///   - modelContext: The ModelContext used for deletion.
    func delete(_ at: IndexSet, modelContext: ModelContext) {
        at.forEach { index in
            modelContext.delete(filteredMeeting[index])
        }
    }
}
