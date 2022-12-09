//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

enum MatrixRotator {
    static func rotate<T>(_ matrix: [[T]]) -> [[T]] {
        var result = matrix
        for (i, row) in matrix.enumerated() {
            for (j, column) in row.enumerated() {
                result[row.count - j - 1][matrix.count - i - 1] = column
            }
        }
        return result
    }
}
