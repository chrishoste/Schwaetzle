import SwiftUI

/// A view displaying a header with images for fact details.
struct FactDetailsHeaderView: View {
    
    /// The URLs of the images to be displayed.
    private let imageUrls: [URL]
    
    /// Initializes a new FactDetailsHeaderView instance.
    /// - Parameter imageUrls: An array of image URLs to be displayed.
    init(imageUrls: [URL]) {
        self.imageUrls = imageUrls
    }
    
    var body: some View {
        TabView {
            ForEach(imageUrls, id: \.self) { url in
                AsyncImage(url: url) { image in
                    GeometryReader { geometry in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width)
                            .clipped()
                    }
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 350)
    }
}

/// A preview container for showcasing the appearance of the `FactDetailsHeaderView` view.
#Preview {
    FactDetailsHeaderView(imageUrls: [])
}
