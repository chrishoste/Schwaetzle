import UIKit
import SwiftUI
import SwiftData

/// A protocol defining the context for the meeting scene and its dependencies.
protocol MeetingSceneContext {
    /// Creates and returns the meeting list view controller.
    /// - Returns: A UIViewController representing the meeting list view.
    func makeMeetingListView() -> UIViewController
}

/// The default implementation of the MeetingSceneContext protocol.
class DefaultMeetingSceneContext: MeetingSceneContext {
    /// The network client used for making network requests and handling JSON decoding.
    private let networkClient: NetworkClient
    
    /// The environment providing configuration values.
    private let environment: AppEnvironment
    
    /// Initializes the DefaultMeetingSceneContext with the specified network client and environment.
    /// - Parameters:
    ///   - networkClient: The NetworkClient used for making network requests and handling JSON decoding.
    ///   - environment: The AppEnvironment providing configuration values.
    init(networkClient: NetworkClient, environment: AppEnvironment) {
        self.networkClient = networkClient
        self.environment = environment
    }
    
    /// Creates and returns the meeting list view controller.
    /// - Returns: A UIViewController representing the meeting list view.
    func makeMeetingListView() -> UIViewController {
        let viewModel = MeetingSceneViewModel(fetchMeetingRoomsWorker: makeFetchMeetingRoomsWorker())
        let listView = MeetingMainScene(viewModel: viewModel)
            .modelContainer(for: [Meeting.self])
        
        return UIHostingController(rootView: listView)
    }
    
    /// Creates and returns an instance of FetchMeetingRoomsWorker using the configured network client.
    /// - Returns: An instance of FetchMeetingRoomsWorker.
    private func makeFetchMeetingRoomsWorker() -> FetchMeetingRoomsWorker {
        DefaultFetchMeetingRoomsWorker(networkClient: networkClient, environment: environment)
    }
}
