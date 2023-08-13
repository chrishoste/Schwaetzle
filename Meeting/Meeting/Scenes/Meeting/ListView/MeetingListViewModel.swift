import SwiftUI
import Observation

/// A view model for managing the meeting list.
@Observable class MeetingListViewModel {
    
    /// The array of rooms.
    let rooms: [Room]
    
    /// The filter used for filtering rooms.
    var filter: Filter
    
    /// The selected date for the meeting list.
    var date = Date()
    
    /// A flag indicating whether to show the filter sheet.
    var showFilter: Bool = false
    
    /// The array of filtered rooms based on the applied filter.
    var filteredRooms: [Room] {
        filter.filter(rooms: rooms)
    }
    
    /// A flag indicating whether the meeting list is filtered.
    var isFiltered: Bool {
        filter.isFiltered
    }
    
    /// Initializes the MeetingListViewModel with the specified array of rooms.
    /// - Parameter rooms: The array of rooms.
    init(rooms: [Room]) {
        self.rooms = rooms
        self.filter = .init(rooms: rooms)
    }
}
