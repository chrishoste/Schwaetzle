import Foundation

/// A protocol defining the basic authentication environment configuration.
protocol BasicAuthEnvironment {
    /// The username for basic authentication.
    var username: String { get }
    
    /// The password for basic authentication.
    var password: String { get }
}
