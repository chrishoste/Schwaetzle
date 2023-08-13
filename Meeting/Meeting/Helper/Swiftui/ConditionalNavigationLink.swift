import SwiftUI
/// A conditional navigation link that conditionally presents a navigation link or its content based on a condition.
struct ConditionalNavigationLink<Content: View>: View {
    /// The value associated with the navigation link.
    let value: any Hashable
    /// The condition that determines whether to show the navigation link or not.
    let conditon: Bool
    
    /// The content to display inside the navigation link.
    @ViewBuilder var content: () -> Content
    
    /// Initializes a new ConditionalNavigationLink instance.
    /// - Parameters:
    ///   - value: The value associated with the navigation link.
    ///   - condition: The condition that determines whether to show the navigation link or not.
    ///   - content: The content to display inside the navigation link.
    init(value: any Hashable, conditon: Bool = true, content: @escaping () -> Content) {
        self.value = value
        self.conditon = conditon
        self.content = content
    }

    var body: some View {
        if conditon {
            NavigationLink(value: value) {
                content()
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            content()
        }
    }
}
