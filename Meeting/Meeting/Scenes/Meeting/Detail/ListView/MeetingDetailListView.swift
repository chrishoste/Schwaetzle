import SwiftUI
import SwiftData

/// A view that displays a list of meeting details or an empty view if no meetings are present.
struct MeetingDetailListView: View {
    /// The environment object to access the model context.
    @Environment(\.modelContext) private var modelContext
    
    private var viewModel: MeetingDetailListViewModel
    
    /// Initializes a new MeetingDetailListView instance.
    /// - Parameters:
    ///   - date: The selected date for the meeting details.
    ///   - roomID: The ID of the meeting room.
    ///   - meetings: The array of meetings.
    init(date: Date, roomID: String, meetings: [Meeting]) {
        self.viewModel = .init(date: date, roomID: roomID, meetings: meetings)
    }
    
    var body: some View {
        if viewModel.filteredMeeting.isEmpty {
            EmptyBookingListView(date: viewModel.date)
        } else {
            List {
                ForEach(viewModel.filteredMeeting, id: \.id) { meeting in
                    BookingCell(title: meeting.title, startDate: meeting.starts, endDate: meeting.ends)
                }
                .onDelete { indexSet in
                    viewModel.delete(indexSet, modelContext: modelContext)
                }
            }
            .listStyle(.plain)
        }
    }
}

/// A preview container for showcasing the appearance of the `MeetingDetailListView` view.
#Preview {
    MeetingDetailListView(date: .now, roomID: "1", meetings: PreviewData.meetings)
        .modelContainer(previewContainer)
}
