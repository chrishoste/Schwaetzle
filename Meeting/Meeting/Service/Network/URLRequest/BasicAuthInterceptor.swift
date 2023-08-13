import Foundation
import OSLog

/// An interceptor for adding Basic Authentication headers to URLRequest instances.
struct BasicAuthInterceptor: URLRequestInterceptor {
    
    /// The logger for recording events related to the BasicAuthInterceptor.
    private let logger = Logger(subsystem: "com.hoste.Meeting", category: "BasicAuthInterceptor")
    
    /// The environment containing the username and password for Basic Authentication.
    private let environment: BasicAuthEnvironment
    
    /// Initializes a new BasicAuthInterceptor instance.
    /// - Parameter environment: The environment containing the username and password.
    init(environment: BasicAuthEnvironment) {
        self.environment = environment
    }
    
    /// Intercepts and modifies the provided URLRequest to include Basic Authentication headers.
    /// - Parameter request: The original URLRequest to be intercepted.
    /// - Returns: A new URLRequest with added Basic Authentication headers, if successful;
    ///            otherwise, the original URLRequest is returned.
    ///
    /// Example usage:
    /// ```swift
    /// let authInterceptor = BasicAuthInterceptor(environment: some BasicAuthEnvironment)
    /// var request = URLRequest(url: someURL)
    /// request = authInterceptor.intercept(request)
    /// // Use the modified request for making network calls with Basic Authentication
    /// ```
    func intercept(_ request: URLRequest) -> URLRequest {
        var request = request
        
        let basicAuthData = "\(environment.username):\(environment.password)".data(using: .utf8)
        
        guard let base64AuthString = basicAuthData?.base64EncodedString() else {
            logger.info("Failed to encode auth data, unable to add Authorization header to request")
            return request
        }
        
        request.setValue("Basic \(base64AuthString)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
