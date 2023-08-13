import SwiftUI

/// A button for selecting filter options.
struct FilterOptionButton: View {
    /// The title of the filter option button.
    private let title: String
    /// Indicates whether the option is selected or not.
    private let isSelected: Bool
    /// The action to perform when the button is tapped.
    private let action: () -> Void
    
    /// Initializes the FilterOptionButton with the provided parameters.
    /// - Parameters:
    ///   - title: The title of the filter option button.
    ///   - isSelected: Indicates whether the option is selected or not.
    ///   - action: The action to perform when the button is tapped.
    init(title: String, isSelected: Bool, action: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(isSelected ? Color.accentColor : Color.gray.opacity(0.2))
                .padding(.horizontal, 3)
            
            Text(title)
                .foregroundStyle(isSelected ? Color.white : Color.primary)
                .padding(.vertical, 6)
        }
        .onTapGesture {
            action()
        }
    }
}

/// A preview container for showcasing the appearance of the `FilterOptionButton` view.
#Preview {
    FilterOptionButton(title: "test", isSelected: true) {}
}
