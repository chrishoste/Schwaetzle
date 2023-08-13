import SwiftUI

/// A view representing an arrow button within a meeting list cell.
struct MeetingListCellArrowView: View {
    /// The text displayed on the arrow button.
    private let text: String
    
    /// Initializes the MeetingListCellArrowView with the provided text.
    /// - Parameter text: The text displayed on the arrow button.
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(text) →")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(Color.gray.opacity(0.11))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.trailing, 8)
        .padding(.bottom, 8)
    }
}

#Preview {
    MeetingListCellArrowView(text: "Test")
}
