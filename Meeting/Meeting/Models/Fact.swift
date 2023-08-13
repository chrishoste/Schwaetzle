import Foundation

/// A struct representing a fact.
struct Fact: Decodable, Hashable {
    let title: String
    let text: String
    let images: [String]
    
    /// Converts the image URLs from strings to URL objects.
    var imageUrls: [URL] {
        images.compactMap { URL(string: $0) }
    }
}
