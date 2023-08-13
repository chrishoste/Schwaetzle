import SwiftUI

/// A view representing a form for adding a new meeting event.
struct AddMeetingForm: View {
    /// Binding to the title of the meeting.
    @Binding var title: String
    
    /// Binding to the start date of the meeting.
    @Binding var startDate: Date
    
    /// Binding to the end date of the meeting.
    @Binding var endDate: Date
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                DatePicker("Starts",
                           selection: $startDate,
                           in: Date.now...,
                           displayedComponents: [.hourAndMinute, .date])
                DatePicker("Ends",
                           selection: $endDate,
                           in: startDate...,
                           displayedComponents: [.hourAndMinute, .date])
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }
}

/// A preview container for showcasing the appearance of the `AddMeetingForm` view.
#Preview {
    AddMeetingForm(title: .constant("Reason: Meeting Room"),
                   startDate: .constant(.now),
                   endDate: .constant(.now + (30*60)))
}
