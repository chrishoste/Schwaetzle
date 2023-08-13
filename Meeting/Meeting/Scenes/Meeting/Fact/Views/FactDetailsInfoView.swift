import SwiftUI

/// A view displaying title and text information for fact details.
struct FactDetailsInfoView: View {
    
    /// The title to be displayed.
    private let title: String
    /// The text content to be displayed.
    private let text: String
    
    /// Initializes a new FactDetailsInfoView instance.
    /// - Parameters:
    ///   - title: The title to be displayed.
    ///   - text: The text content to be displayed.
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.heavy)
                Spacer()
            }
            
            Text(text)
                .font(.footnote)
        }
        .padding()
    }
}

/// A preview container for showcasing the appearance of the `FactDetailsInfoView` view.
#Preview {
    FactDetailsInfoView(title: "Test", text: "test")
}
