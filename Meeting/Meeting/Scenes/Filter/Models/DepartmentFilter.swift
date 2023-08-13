import Foundation

/// A filter class that implements the Filterable protocol to filter rooms by department.
class DepartmentFilter: Filterable {    
    /// The key identifier for this filter.
    static var info: String = "department"
    
    /// The title of the filter.
    var title: String = "Department"
    
    /// The currently selected filter.
    var selectedFilter: String
    
    /// An array of available filter options.
    var filterOptions: [String]
    
    /// Initializes the DepartmentFilter with the available rooms to extract unique departments.
    /// - Parameter rooms: The array of rooms to extract departments from.
    init(rooms: [Room]) {
        selectedFilter = ""
        filterOptions = Array(Set(rooms.map { $0.department }))
    }
    
    /// Filters the array of rooms based on the selected department filter.
    /// - Parameter processable: The array of rooms to be filtered.
    /// - Returns: The filtered array of rooms.
    func filter(_ processable: [Room]) -> [Room] {
        guard !selectedFilter.isEmpty else { return processable }
        return processable.filter { $0.department == selectedFilter }
    }
}
