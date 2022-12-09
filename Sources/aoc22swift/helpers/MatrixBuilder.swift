//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

enum MatrixBuilder {
    static func buildMatrix(from input: String) -> [[IdentifiableDigit]] {
        let lines = input.split(separator: "\n")
        // assert that all lines have the same length
        let lineLength = lines[0].count
        assert(lines.allSatisfy { $0.count == lineLength })
        return lines.map { line in
            line.map { char in
                IdentifiableDigit(digit: Int(String(char))!)
            }
        }
    }
}
