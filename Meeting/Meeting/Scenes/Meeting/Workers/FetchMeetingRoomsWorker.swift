import Foundation

/// An error type representing potential errors encountered in the FetchMeetingRoomsWorker.
enum FetchMeetingRoomsWorkerError: Error {
    /// An error case indicating failure to unwrap the meeting room URL.
    case failedToUnwrapURL
}

/// A protocol defining the responsibilities of the FetchMeetingRoomsWorker and its dependencies.
protocol FetchMeetingRoomsWorker {
    /// Asynchronously fetches meeting room data and returns an array of Room objects.
    /// - Returns: An array of Room objects representing meeting room data.
    /// - Throws: An error if there's an issue with fetching or processing the meeting room data.
    func fetchMeetingRooms() async throws -> [Room]
}

/// A protocol defining the environment requirements for fetching meeting room data.
protocol FetchMeetingRoomsEnvironment {
    /// The URL string for meeting room data.
    var meetingRoomUrl: String { get }
}

/// The default implementation of the FetchMeetingRoomsWorker protocol.
struct DefaultFetchMeetingRoomsWorker: FetchMeetingRoomsWorker {
    /// The network client used for making network requests and handling JSON decoding.
    private let networkClient: NetworkClient
    
    /// The environment providing configuration values for fetching meeting room data.
    private let environment: FetchMeetingRoomsEnvironment
    
    /// Initializes the DefaultFetchMeetingRoomsWorker with the specified network client and environment.
    /// - Parameters:
    ///   - networkClient: The NetworkClient used for making network requests and handling JSON decoding.
    ///   - environment: The FetchMeetingRoomsEnvironment providing configuration values.
    init(networkClient: NetworkClient, environment: FetchMeetingRoomsEnvironment) {
        self.networkClient = networkClient
        self.environment = environment
    }
    
    /// Asynchronously fetches meeting room data and returns an array of Room objects.
    /// - Returns: An array of Room objects representing meeting room data.
    /// - Throws: An error if there's an issue with fetching or processing the meeting room data.
    func fetchMeetingRooms() async throws -> [Room] {
        guard let url = URL(string: environment.meetingRoomUrl) else {
            throw FetchMeetingRoomsWorkerError.failedToUnwrapURL
        }
        
        return try await networkClient.fetch(from: url)
    }
}
