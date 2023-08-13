import SwiftUI

/// A view representing a cell displaying information about a meeting room.
struct MeetingCell: View {
    /// The room to display.
    private let room: Room
    
    /// Initializes the MeetingCell with the specified room.
    /// - Parameter room: The room to display.
    init(room: Room) {
        self.room = room
    }
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingDetailsView(room: room)
            bookingIfNeeded()
        }
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .padding(.horizontal, 12)
    }
}

private extension MeetingCell {
    /// Displays a "book now" arrow if the room is a meeting room, otherwise an empty view.
    @ViewBuilder
    func bookingIfNeeded() -> some View {
        if room.isMeetingRoom {
            MeetingListCellArrowView(text: "book now")
        } else {
            EmptyView()
        }
    }
}

#Preview {
    MeetingCell(room: PreviewData.room)
}
