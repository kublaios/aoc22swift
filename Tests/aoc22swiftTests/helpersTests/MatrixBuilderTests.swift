//
// Created by Kubilay Erdogan on 2022-12-09.
//

import XCTest
@testable import aoc22swift

final class MatrixBuilderTests: XCTestCase {
    func testBuildsMatrix() {
        let input = """
                    30373
                    25512
                    65332
                    33549
                    35390
                    """
        let matrix = MatrixBuilder.buildMatrix(from: input)
        let matrixDigits: [[Int]] = matrix.map { $0.map { $0.digit } }
        XCTAssertEqual(matrixDigits, [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]])
    }
}
