import Foundation
import Observation

/// The view model for the Earthquake Scene, responsible for managing the state and data related to earthquakes.
@Observable class MeetingSceneViewModel {
    /// The current state of the Earthquake Scene, represented as a published property.
    var state: State = .loading

    /// The earthquake worker responsible for fetching earthquake data.
    private let fetchMeetingRoomsWorker: FetchMeetingRoomsWorker
    
    /// Initializes the EarthquakeSceneViewModel with the specified earthquake worker.
    /// - Parameter earthquakeWorker: The EarthquakeWorker used for fetching earthquake data.
    init(fetchMeetingRoomsWorker: FetchMeetingRoomsWorker) {
        self.fetchMeetingRoomsWorker = fetchMeetingRoomsWorker
    }
    
    /// Asynchronously fetches earthquake data and updates the state accordingly.
    @MainActor
    func fetchMeetingRooms() async {
        state = .loading
        do {
            state = .data(try await fetchMeetingRoomsWorker.fetchMeetingRooms())
        } catch {
            state = .error
        }
    }
}

/// An extension of EarthquakeSceneViewModel defining its possible states.
extension MeetingSceneViewModel {
    /// Represents the different states of the Earthquake Scene view model.
    enum State {
        /// The loading state, indicating that earthquake data is being fetched.
        case loading
        /// The error state, indicating that an error occurred while fetching earthquake data.
        case error
        /// The data state, containing an array of Earthquake objects fetched successfully.
        case data([Room])
    }
}
