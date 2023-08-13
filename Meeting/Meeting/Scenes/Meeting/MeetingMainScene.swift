import SwiftUI

/// A SwiftUI view representing the main scene displaying earthquake information.
struct MeetingMainScene: View {
    /// The view model containing the state and logic for the earthquake scene.
    var viewModel: MeetingSceneViewModel
    
    var body: some View {
        content()
        .task {
            await viewModel.fetchMeetingRooms()
        }
    }
}

/// A private extension on EarthquakeScene providing the main content view of the scene.
private extension MeetingMainScene {
    /// The main content view of the earthquake scene, determined by the state of the view model.
    @ViewBuilder
    func content() -> some View {
        VStack(spacing: 0, content: {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                ErrorView {
                    Task {
                        await viewModel.fetchMeetingRooms()
                    }
                }
            case .data(let rooms):
                MeetingListView(viewModel: .init(rooms: rooms))
            }
        })
    }
}
