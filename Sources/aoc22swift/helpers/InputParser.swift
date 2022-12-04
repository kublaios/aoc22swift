//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum InputParser {
    // Parses input.txt at the given #file path
    static func parseInput(from file: String) -> String {
        // URL of the file at root
        let url = URL(fileURLWithPath: file)
            .deletingLastPathComponent()
            .appendingPathComponent("input.txt")

        // Contents of the file
        let contents = try! String(contentsOf: url)

        return contents
    }
}
