import SwiftUI

/// A view representing a cell item in a meeting list.
struct MeetingCellItem: View {
    /// The title of the cell item.
    private let title: String
    /// The name of the image to display.
    private let imageName: String
    
    /// Initializes the MeetingCellItem with the provided parameters.
    /// - Parameters:
    ///   - title: The title of the cell item.
    ///   - imageName: The name of the image to display.
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 20)
                .foregroundStyle(Color.accentColor.opacity(0.5))
                .font(.body)
            Text(title)
                .foregroundStyle(Color.primary)
                .font(.subheadline)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    MeetingCellItem(title: "Test", imageName: "plus")
}
