import SwiftUI

/// A view representing a cell displaying information about a meeting room and its associated fact.
struct FactCell: View {
    /// The room associated with the fact.
    private let room: Room
    /// The fact to display.
    private let fact: Fact
    
    /// Initializes the FactCell with the specified room and fact.
    /// - Parameters:
    ///   - room: The room associated with the fact.
    ///   - fact: The fact to display.
    init(room: Room, fact: Fact) {
        self.room = room
        self.fact = fact
    }
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingDetailsView(room: room)
            
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 0.5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("FACT")
                        .font(.caption2)
                        .fontWeight(.black)
                        .foregroundStyle(.secondary)
                    Text(fact.title)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .lineLimit(1)
                    Text(fact.text)
                        .font(.footnote)
                        .lineLimit(4)
                    Spacer()
                }
            }
            .padding(.all, 8)
            
            MeetingListCellArrowView(text: "read more")
        }
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .padding(.horizontal, 12)
    }
}


#Preview {
    FactCell(room: PreviewData.room, fact: PreviewData.fact)
}
