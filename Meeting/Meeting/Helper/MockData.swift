import SwiftData
import SwiftUI

/// A utility struct containing preview data for meetings.
enum PreviewData {
    /// An array of mock meeting instances.
    static let meetings: [Meeting] = (0...20).map { index in
        return .init(roomId: "1", title: "Title \(index)", starts: .now, ends: .now)
    }
    
    static let room: Room = .init(id: "1", name: "Test", department: "test", type: "Test", roomNumber: "5", officeLevel: "1", fact: nil)
    static let fact: Fact = .init(title: "Test", text: "test", images: [])
}

/// A container struct for initializing preview data.
@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Meeting.self, .init(inMemory: true))
        
        // Inserting preview meetings into the main context of the container.
        PreviewData.meetings.forEach { meeting in
            container.mainContext.insert(meeting)
        }
        
        return container
    } catch {
        fatalError("Failed to create preview container: \(error)")
    }
}()
