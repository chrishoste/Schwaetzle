import Foundation

/// A protocol for intercepting and modifying URL requests before they are made.
protocol URLRequestInterceptor {
    /// Intercepts and modifies the provided URLRequest.
    /// - Parameter request: The original URLRequest to be intercepted.
    /// - Returns: A new URLRequest that may have been modified by the interceptor.
    func intercept(_ request: URLRequest) -> URLRequest
}

/// A protocol for providing URL requests.
protocol URLRequestProvider {
    /// Generates a URLRequest for the given URL.
    /// - Parameter url: The URL for which the URLRequest is to be generated.
    /// - Returns: A URLRequest instance.
    func urlRequest(for url: URL) -> URLRequest
}

/// A default implementation of the URLRequestProvider protocol that supports request interception.
struct DefaultURLRequestProvider: URLRequestProvider {
    private let interceptors: [URLRequestInterceptor]
    
    /// Initializes a new DefaultURLRequestProvider instance.
    /// - Parameter interceptors: An array of URLRequestInterceptor objects to intercept and modify requests.
    init(interceptors: [URLRequestInterceptor]) {
        self.interceptors = interceptors
    }
    
    /// Generates a URLRequest for the given URL, applying any configured interceptors.
    /// - Parameter url: The URL for which the URLRequest is to be generated.
    /// - Returns: A URLRequest instance that may have been modified by the interceptors.
    ///
    /// Example usage:
    /// ```swift
    /// let interceptor = MyRequestInterceptor()
    /// let requestProvider = DefaultURLRequestProvider(interceptors: [interceptor])
    /// let url = URL(string: "https://example.com/api")!
    /// let request = requestProvider.urlRequest(for: url)
    /// // Use the generated and intercepted request for making network calls
    /// ```
    func urlRequest(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        
        // Apply each interceptor to the request
        interceptors.forEach { request = $0.intercept(request) }
        
        return request
    }
}
