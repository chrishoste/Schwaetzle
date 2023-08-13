import Foundation

/// A client for making network requests and handling JSON decoding.
struct NetworkClient {
    private let requestProvider: URLRequestProvider
    
    /// Initializes a new `NetworkClient` instance.
    /// - Parameter requestProvider: The object responsible for providing URL requests.
    init(requestProvider: URLRequestProvider) {
        self.requestProvider = requestProvider
    }
    
    /// Fetches data from the specified URL and decodes it into the specified type.
    /// - Parameters:
    ///   - url: The URL from which to fetch data.
    /// - Returns: An instance of the specified type `T`, decoded from the data received from the URL.
    /// - Throws: An error of type `Error`, indicating failures either in network requests or JSON decoding.
    ///
    /// Example usage:
    /// ```swift
    /// do {
    ///     let client = NetworkClient(requestProvider: MyURLRequestProvider())
    ///     let data: MyDecodableType = try await client.fetch(from: someURL)
    ///     // Use the decoded data here
    /// } catch {
    ///     print("An error occurred: \(error)")
    /// }
    /// ```
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: requestProvider.urlRequest(for: url))
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
