import UIKit

/// A protocol defining the application context and its dependencies.
protocol AppContext {
    /// Retrieves the entry view controller for the application.
    /// - Returns: The entry view controller that should be displayed when the application starts.
    func entryViewController() -> UIViewController
}

/// The default implementation of the AppContext protocol, providing access to dependencies.
final class DefaultAppContext: AppContext {
    
    /// The environment providing configuration values.
    let environment: AppEnvironment
    
    /// Initializes a new DefaultAppContext instance.
    /// - Parameter environment: The environment providing configuration values.
    init(environment: AppEnvironment) {
        self.environment = environment
    }
    
    /// The URL request provider responsible for generating URLRequest instances with interceptors.
    lazy var urlRequestProvider: URLRequestProvider = {
        DefaultURLRequestProvider(interceptors: [
            // Add if Basic Auth Header is needed
            // BasicAuthInterceptor(environment: environment)
        ])
    }()
    
    /// The network client used for making network requests and handling JSON decoding.
    lazy var networkClient: NetworkClient = {
        NetworkClient(requestProvider: urlRequestProvider)
    }()
    
    /// The earthquake context, which provides access to earthquake-related scenes and data.
    lazy var meetingSceneContext: MeetingSceneContext = {
        DefaultMeetingSceneContext(networkClient: networkClient, environment: environment)
    }()
    
    /// Retrieves the entry view controller for the application.
    /// - Returns: The entry view controller for the application.
    func entryViewController() -> UIViewController {
        meetingSceneContext.makeMeetingListView()
    }
}
