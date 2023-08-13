import SwiftUI

/// A view for displaying a filter option header.
struct FilterOptionHeader: View {
    /// The title of the filter option header.
    private let title: String
    
    /// Initializes the FilterOptionHeader with the provided title.
    /// - Parameter title: The title of the filter option header.
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundStyle(Color.primary)
            Spacer()
        }
    }
}

/// A preview container for showcasing the appearance of the `FilterOptionHeader` view.
#Preview {
    FilterOptionHeader(title: "Test")
}
