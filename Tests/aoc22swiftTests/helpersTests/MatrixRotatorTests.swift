//
// Created by Kubilay Erdogan on 2022-12-09.
//

import XCTest
@testable import aoc22swift

final class MatrixRotatorTests: XCTestCase {
    func testRotatesMatrix() {
        let matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        let expected = [[9, 6, 3], [8, 5, 2], [7, 4, 1]]
        let rotatedMatrix = MatrixRotator.rotate(matrix)
        XCTAssertEqual(rotatedMatrix, expected)
    }

    func testRotatesRotatedMatrix() {
        let matrix = [[9, 6, 3], [8, 5, 2], [7, 4, 1]]
        let expected = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        let rotatedMatrix = MatrixRotator.rotate(matrix)
        XCTAssertEqual(rotatedMatrix, expected)
    }
}
