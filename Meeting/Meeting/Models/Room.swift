import Foundation

/// A struct representing a room.
struct Room: Decodable, Hashable {
    let id: String
    let name: String
    let department: String
    let type: String
    let roomNumber: String
    let officeLevel: String
    let fact: Fact?
    
    /// Determines if the room is a meeting room based on its type.
    var isMeetingRoom: Bool {
        type == "meeting"
    }
}

//extension Room {
//    enum CodingKeys: String, CodingKey {
//        case roomNumber, officeLevel, fact, name, department, id
//        case type, typ
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        fact = try container.decodeIfPresent(Fact.self, forKey: .fact)
//        name = try container.decode(String.self, forKey: .name)
//        department = try container.decode(String.self, forKey: .department)
//        id = try container.decode(String.self, forKey: .id)
//        
//        if let stringValue = try? container.decode(String.self, forKey: .roomNumber), !stringValue.isEmpty {
//            roomNumber = stringValue
//        } else if let intValue = try? container.decode(Int.self, forKey: .roomNumber) {
//            roomNumber = String(intValue)
//        } else {
//            roomNumber = "🤷‍♂️"
//        }
//        
//        if let intValue = try? container.decode(Int.self, forKey: .officeLevel) {
//            officeLevel = String(intValue)
//        } else if let stringValue = try? container.decode(String.self, forKey: .officeLevel), !stringValue.isEmpty {
//            officeLevel = stringValue
//        } else {
//            officeLevel = "🤷‍♂️"
//        }
//        
//        if let typeValue = try? container.decode(String.self, forKey: .type) {
//            type = typeValue
//        } else if let typoTypeValue = try? container.decode(String.self, forKey: .typ) {
//            type = typoTypeValue
//        } else {
//            type = "🤷‍♂️"
//        }
//    }
//}
