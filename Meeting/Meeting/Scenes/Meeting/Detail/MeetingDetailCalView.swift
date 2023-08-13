import SwiftUI

/// A view representing a date picker for selecting a date.
struct MeetingDetailCalView: View {
    /// Binding to the selected date.
    @Binding var date: Date

    var body: some View {
        DatePicker("",
                   selection: $date,
                   in: Date.now...,
                   displayedComponents: [.date])
        .datePickerStyle(.graphical)
        .background(Color.gray.opacity(0.1))
        .onAppear {
            // Setting the minute interval for the UIDatePicker.
            UIDatePicker.appearance().minuteInterval = 15
        }
    }
}

/// A preview container for showcasing the appearance of the `MeetingDetailCalView` view.
#Preview {
    MeetingDetailCalView(date: .constant(.now))
}
