import SwiftUI

/// A view displaying details for a specific fact.
struct FactDetailsView: View {
    
    /// The fact object to display details for.
    private let fact: Fact
    
    /// Initializes a new FactDetailsView instance.
    /// - Parameter fact: The fact object to display details for.
    init(fact: Fact) {
        self.fact = fact
    }
    
    var body: some View {
        ScrollView {
            VStack {
                FactDetailsHeaderView(imageUrls: fact.imageUrls)
                FactDetailsInfoView(title: fact.title, text: fact.text)
            }
        }
        .navigationTitle("Fact")
    }
}

/// A preview container for showcasing the appearance of the `FactDetailsView` view.
#Preview {
    FactDetailsView(fact: .init(title: "Test", text: "Test", images: []))
}
