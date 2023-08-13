import Foundation

/// A protocol that defines filtering capabilities for a specific type.
protocol Filterable<Processable> {
    associatedtype Processable
    
    /// A key used to identify the filterable type.
    static var info: String { get }
    
    /// The title of the filterable type.
    var title: String { get }
    
    /// The currently selected filter.
    var selectedFilter: String { get set }
    
    /// An array of available filter options.
    var filterOptions: [String] { get }
    
    /// Filters the provided processable data using the selected filter.
    /// - Parameter processable: The data to be filtered.
    /// - Returns: The filtered data.
    func filter(_ processable: Processable) -> Processable
}
