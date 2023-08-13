import Foundation

/// An alias for `BasicAuthEnvironment` for clarity and consistency.
typealias AppEnvironment = BasicAuthEnvironment & FetchMeetingRoomsEnvironment

/// A default implementation of the `Environment` protocol, providing access to configuration values.
struct DefaultEnvironment: AppEnvironment {
    // MARK: - Keys
    
    /// The keys used to access configuration values from the bundle's Info.plist file.
    enum Key: String {
        case officeUrl
        case basicAuthUser
        case basicAuthPw
    }
    
    /// The URL of the office obtained from the bundle's configuration.
    private var officeUrl: String {
        return Bundle.main.getInfoOrFail(.officeUrl)
    }
    
    /// The Basic Authentication username obtained from the bundle's configuration.
    private var basicAuthUser: String {
        return Bundle.main.getInfoOrFail(.basicAuthUser)
    }
    
    /// The Basic Authentication password obtained from the bundle's configuration.
    private var basicAuthPw: String {
        return Bundle.main.getInfoOrFail(.basicAuthPw)
    }
}

// MARK: - DefaultEnvironment BasicAuthEnvironment implementation
extension DefaultEnvironment {
    var username: String { basicAuthUser }
    var password: String { basicAuthPw }
    var meetingRoomUrl: String { officeUrl }
}

// MARK: - Bundle Extension
private extension Bundle {
    /// Retrieves the configuration value for the given key from the bundle's Info.plist file.
    /// - Parameter key: The configuration key to retrieve the value for.
    /// - Returns: The configuration value associated with the provided key.
    func getInfoOrFail(_ key: DefaultEnvironment.Key) -> String {
        guard let info = infoDictionary?[key.rawValue] as? String, !info.isEmpty else {
            fatalError("Could not find value for key=\(key) in the bundle's Info.plist file")
        }
        
        return info
    }
}
