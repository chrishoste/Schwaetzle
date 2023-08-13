import SwiftUI

/// A view for displaying a filter option section.
struct FilterOptionView: View {
    /// The filterable object that contains filter options.
    private let filtereable: any Filterable
    
    /// A closure called when a filter option is selected.
    private let didSelect: (String) -> Void
    
    /// Initializes the FilterOptionView with the provided filterable object and selection closure.
    /// - Parameters:
    ///   - filtereable: The filterable object containing filter options.
    ///   - didSelect: The closure called when a filter option is selected.
    init(filtereable: any Filterable, didSelect: @escaping (String) -> Void) {
        self.filtereable = filtereable
        self.didSelect = didSelect
    }
    
    var body: some View {
        FilterOptionHeader(title: filtereable.title)
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(filtereable.filterOptions.sorted { $0 < $1 }, id: \.self) { option in
                FilterOptionButton(title: option, isSelected: option == filtereable.selectedFilter) {
                    didSelect(option)
                }
            }
        }
    }
}
