import Foundation

/// A filter class that implements the Filterable protocol to filter rooms by types.
class TypesFilter: Filterable {    
    /// The key identifier for this filter.
    static var info: String = "types"
    
    /// The title of the filter.
    var title: String = "Types"
    
    /// The currently selected filter.
    var selectedFilter: String
    
    /// An array of available filter options.
    var filterOptions: [String]
    
    /// Initializes the TypesFilter with the available rooms to extract unique types.
    /// - Parameter rooms: The array of rooms to extract types from.
    init(rooms: [Room]) {
        selectedFilter = ""
        filterOptions = Array(Set(rooms.map { $0.type }))
    }
    
    /// Filters the array of rooms based on the selected type filter.
    /// - Parameter processable: The array of rooms to be filtered.
    /// - Returns: The filtered array of rooms.
    func filter(_ processable: [Room]) -> [Room] {
        guard !selectedFilter.isEmpty else { return processable }
        return processable.filter { $0.type == selectedFilter }
    }
}
