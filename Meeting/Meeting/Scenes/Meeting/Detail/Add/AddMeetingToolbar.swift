import SwiftUI

/// A view representing a custom toolbar for adding a new meeting event.
struct AddMeetingToolbar: View {
    /// A flag indicating whether the "Add" button should be disabled.
    let addDisabled: Bool
    
    /// A closure to execute when the "Cancel" button is tapped.
    let onCancel: () -> Void
    
    /// A closure to execute when the "Add" button is tapped.
    let onAdd: () -> Void
    
    var body: some View {
        HStack {
            Button("Cancel") {
                onCancel()
            }
            Spacer()
            Text("New Event")
                .fontWeight(.bold)
            Spacer()
            Button("Add") {
                onAdd()
            }
            .disabled(addDisabled)
        }
        .padding()
    }
}

/// A preview container for showcasing the different states of the `AddMeetingToolbar` view.
#Preview {
    VStack {
        AddMeetingToolbar(addDisabled: true) {
            // Define onCancel action
        } onAdd: {
            // Define onAdd action
        }
        AddMeetingToolbar(addDisabled: false) {
            // Define onCancel action
        } onAdd: {
            // Define onAdd action
        }
    }
}
