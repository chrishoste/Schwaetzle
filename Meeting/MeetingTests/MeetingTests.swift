import XCTest
@testable import Meeting

final class MeetingTests: XCTestCase {

    func testExample() throws {
        let decoder = JSONDecoder()
        let decodedroomRoomNumberString = try decoder.decode(Room.self, from: Data(MockData.roomRoomNumberString.utf8))
        
        XCTAssertEqual(decodedroomRoomNumberString.roomNumber, "4.1-04")
    }
}

private enum MockData {
    static let roomRoomNumberString = """
        {
            "roomNumber": "4.1-04",
            "officeLevel": "4",
            "name": "Play and fun room",
            "department": "all",
            "type": "public",
            "id": "3DS8rJR6sXlIuRgMv5nZ"
        }
    """
}
