import Foundation

extension String {
    /// Converts the first character of the string to uppercase.
    /// - Returns: A new string with the first character converted to uppercase.
    func upperCaseFirstChar() -> String {
        guard let firstChar = self.first else {
            return self
        }
        
        return String(firstChar).uppercased() + self.dropFirst()
    }
}
