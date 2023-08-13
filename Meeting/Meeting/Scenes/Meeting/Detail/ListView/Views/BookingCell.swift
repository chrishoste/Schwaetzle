import SwiftUI

/// A view representing a cell displaying meeting information.
struct BookingCell: View {
    /// The title of the meeting.
    private let title: String
    
    /// The start date of the meeting.
    private let startDate: Date
    
    /// The end date of the meeting.
    private let endDate: Date
    
    /// Initializes a new MeetingCell instance.
    /// - Parameters:
    ///   - title: The title of the meeting.
    ///   - startDate: The start date of the meeting.
    ///   - endDate: The end date of the meeting.
    init(title: String, startDate: Date, endDate: Date) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
    
    var body: some View {
        HStack {
            decoratorView()
            
            Text(title)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                dateText(date: startDate)
                dateText(date: endDate)
            }
        }
    }
}

private extension BookingCell {
    /// Creates a decorative view with an accent-colored rounded rectangle.
    @ViewBuilder
    func decoratorView() -> some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(Color.accentColor)
            .frame(width: 6)
    }
    
    /// Creates a text view displaying the date.
    @ViewBuilder
    func dateText(date: Date) -> some View {
        Text(date, format: .dateTime.hour().minute())
            .font(.footnote)
            .foregroundStyle(Color.secondary)
    }
}

/// A preview container for showcasing the appearance of the `MeetingCell` view.
#Preview {
    BookingCell(title: "Test", startDate: .now, endDate: .now + (15*60))
        .frame(height: 50)
}
