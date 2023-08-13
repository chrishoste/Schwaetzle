import SwiftUI

/// A view that displays filter options in a sheet.
struct FilterSheet: View {
    /// The filter used for managing filter options.
    private let filter: Filter
    
    /// Initializes the FilterSheet with the specified filter.
    /// - Parameter filter: The filter containing filter options.
    init(filter: Filter) {
        self.filter = filter
    }
    
    var body: some View {
        ScrollView {
            ForEach(filter.filters, id: \.title) { filterable in
                FilterOptionView(filtereable: filterable) { selected in
                    filter.selectFilter(for: type(of: filterable).info, filter: selected)
                }
            }
        }
        .padding()
    }
}

/// A preview container for showcasing the appearance of the `FilterSheet` view.
#Preview {
        FilterSheet(filter: .init(rooms: []))
}
