import SwiftUI

/// A view representing the details of a meeting room.
struct MeetingDetailsView: View {
    /// The room to display details for.
    private let room: Room
    
    /// Initializes the MeetingDetailsView with the specified room.
    /// - Parameter room: The room to display details for.
    init(room: Room) {
        self.room = room
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(room.department.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundStyle(.secondary)
                
                Text(room.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                HStack(spacing: 12) {
                    MeetingCellItem(title: room.roomNumber, imageName: "number.square.fill")
                    MeetingCellItem(title: room.officeLevel, imageName: "arrow.up.right.square.fill")
                    MeetingCellItem(title: room.type, imageName: "calendar")
                }
            }
            .padding(.all, 8)
            
            Spacer()
        }
    }
}

#Preview {
    MeetingDetailsView(room: PreviewData.room)
}
