import SwiftUI

/// A toolbar button for toggling filters.
struct FilterToolBarButton: View {
    /// Binding to control the visibility of the filter.
    @Binding private var showFilter: Bool
    /// Indicates whether the data is filtered or not.
    private let isFiltered: Bool
    
    /// Initializes a new FilterToolBarButton instance.
    /// - Parameters:
    ///   - showFilter: Binding to control the visibility of the filter.
    ///   - isFiltered: Indicates whether the data is filtered or not.
    init(showFilter: Binding<Bool>, isFiltered: Bool) {
        self._showFilter = showFilter
        self.isFiltered = isFiltered
    }
    
    var body: some View {
        Button {
            showFilter = true
        } label: {
            Image(systemName: imageName)
        }
    }
}

private extension FilterToolBarButton {
    /// The name of the system image based on the filter state.
    var imageName: String {
        isFiltered ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle"
    }
}

/// A preview container for showcasing the appearance of the `FilterToolBarButton` view.
#Preview {
    HStack {
        FilterToolBarButton(showFilter: .constant(true), isFiltered: true)
        FilterToolBarButton(showFilter: .constant(true), isFiltered: false)
    }
}
