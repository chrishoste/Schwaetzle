import SwiftUI

/// A view displayed when no time slots are booked for the given date.
struct EmptyBookingListView: View {
    /// The date for which the view is displayed.
    private let date: Date
    
    /// Initializes the EmptyBookingListView with the specified date.
    /// - Parameter date: The date for which the view is displayed.
    init(date: Date) {
        self.date = date
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("No time slots booked for \(formattedDateTextView()), tap on the \(addButtonTextView()) button to add an event")
                .font(.headline)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
                .padding(20)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

private extension EmptyBookingListView {
    /// Formats the date with day, month, and year.
    func formattedDateTextView() -> Text {
        Text(date, format: .dateTime.day().month().year())
            .fontWeight(.bold)
    }
    
    /// Displays the plus icon as a text.
    func addButtonTextView() -> Text {
        Text(Image(systemName: "plus"))
            .fontWeight(.bold)
    }
}

#Preview {
    EmptyBookingListView(date: .now)
}
