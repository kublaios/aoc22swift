import Foundation

enum GridParser {
    static func parse(from rawInput: String) -> [[Character]] {
        rawInput.split(separator: "\n").map { Array($0) }
    }
}
