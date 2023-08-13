import SwiftUI

/// A view representing a screen for adding a new meeting.
struct AddMeetingView: View {
    /// Binding to control the visibility of a sheet or modal.
    @Binding var showSheet: Bool
    
    /// Binding to the start date of the meeting.
    @Binding var startDate: Date
    
    /// Binding to the end date of the meeting.
    @Binding var endDate: Date
    
    /// Binding to the title of the meeting.
    @Binding var title: String
    
    /// A closure to execute when the "Add" button is tapped.
    let action: () -> Void
    
    var body: some View {
        VStack {
            AddMeetingToolbar(addDisabled: title.isEmpty) {
                showSheet = false
            } onAdd: {
                action()
            }
            
            AddMeetingForm(title: $title, startDate: $startDate, endDate: $endDate)
        }
    }
}

/// A preview container for showcasing the appearance of the `AddMeetingView` view.
#Preview {
    AddMeetingView(showSheet: .constant(false),
                   startDate: .constant(.now),
                   endDate: .constant(.now),
                   title: .constant("Test1")) {}
}
