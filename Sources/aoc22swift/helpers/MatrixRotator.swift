//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

enum MatrixRotator {
    static func rotate<T>(_ matrix: [[T]]) -> [[T]] {
        var result = matrix
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                result[i][j] = matrix[matrix.count - j - 1][i]
            }
        }
        return result
    }
}
