import SwiftUI

/// A view representing a button for adding content.
struct AddButtonView: View {
    /// Binding to control the visibility of a sheet or modal.
    @Binding private var showSheet: Bool
    
    /// Initializes the AddButtonView with the specified binding to control sheet visibility.
    /// - Parameter showSheet: Binding to control the visibility of a sheet or modal.
    init(showSheet: Binding<Bool>) {
        self._showSheet = showSheet
    }
    
    var body: some View {
        Button {
            showSheet = true
        } label: {
            Image(systemName: "plus")
        }
    }
}

/// A preview container for showcasing the appearance of the `AddButtonView` view.
#Preview {    
    AddButtonView(showSheet: .constant(false))
}
