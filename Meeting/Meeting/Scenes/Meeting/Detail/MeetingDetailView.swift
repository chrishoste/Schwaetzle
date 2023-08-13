import SwiftUI
import SwiftData

/// A view representing the details of a meeting.
struct MeetingDetailView: View {
    /// The environment object to access the model context.
    @Environment(\.modelContext) private var modelContext
    /// A query that fetches meetings sorted by start time.
    @Query(sort: \Meeting.starts) private var meetings: [Meeting]
    
    @Bindable private var viewModel: MeetingDetailViewModel
    
    /// Initializes a new MeetingDetailView instance.
    /// - Parameters:
    ///   - roomID: The ID of the room associated with the meeting.
    ///   - roomName: The name of the room associated with the meeting.
    init(roomID: String, roomName: String) {
        self.viewModel = .init(roomID: roomID, roomName: roomName)
    }
    
    /// Initializes a new MeetingDetailView instance with a view model.
    /// - Parameter viewModel: The MeetingDetailViewModel instance to use.
    init(viewModel: MeetingDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            MeetingDetailCalView(date: $viewModel.starts)
            MeetingDetailListView(date: viewModel.starts, roomID: viewModel.roomID, meetings: meetings)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.roomName)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            AddButtonView(showSheet: $viewModel.showSheet)
        }
        .sheet(isPresented: $viewModel.showSheet) {
            AddMeetingView(showSheet: $viewModel.showSheet, startDate: $viewModel.starts, endDate: $viewModel.ends, title: $viewModel.title) {
                viewModel.add(to: modelContext)
            }
        }
    }
}

/// A preview container for showcasing the appearance of the `MeetingDetailView` view.
#Preview {
        MeetingDetailView(roomID: "1", roomName: "Hello")
            .modelContainer(previewContainer)
}
