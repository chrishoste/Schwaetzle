import Foundation
import Observation

/// A class that manages filtering options for rooms.
@Observable class Filter {
    private var filterables: [String: any Filterable<[Room]>]
    
    /// An array of filtered options.
    var filters: [any Filterable<[Room]>] {
        filterables.sorted { $0.value.title > $1.value.title }.map { $0.value }
    }
    
    /// A boolean indicating whether any filters are applied.
    var isFiltered: Bool {
        return filters.first { !$0.selectedFilter.isEmpty } != nil
    }
    
    /// Initializes a new Filter instance with the provided rooms.
    /// - Parameter rooms: The array of rooms to filter.
    init(rooms: [Room]) {
        self.filterables = [
            TypesFilter.info: TypesFilter(rooms: rooms),
            DepartmentFilter.info: DepartmentFilter(rooms: rooms),
        ]
    }
    
    /// Filters the provided array of rooms using the selected filters.
    /// - Parameter rooms: The array of rooms to filter.
    /// - Returns: The filtered array of rooms.
    func filter(rooms: [Room]) -> [Room] {
        var filteredRooms = rooms
        
        for filterable in filterables {
            filteredRooms = filterable.value.filter(filteredRooms)
        }
        
        return filteredRooms
    }
    
    /// Selects a filter option for a specific category.
    /// - Parameters:
    ///   - key: The category key.
    ///   - filter: The selected filter.
    func selectFilter(for key: String, filter: String) {
        guard let filterable = filterables[key] else {
            return
        }
        
        if filterable.selectedFilter == filter {
            filterables[key]?.selectedFilter = ""
            return
        }
        
        filterables[key]?.selectedFilter = filter
    }
}
