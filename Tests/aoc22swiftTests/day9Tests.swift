//
// Created by Kubilay Erdogan on 2022-12-09.
//

import XCTest
@testable import aoc22swift

final class Day9Tests: XCTestCase {
    func testPartOne() {
        let input = """
                    R 4
                    U 4
                    L 3
                    D 1
                    R 4
                    D 1
                    L 5
                    R 2
                    """
        let solution = Day9.Solution(inputProvider: InputProvider(rawInput: input))
        XCTAssertEqual(solution.partOne(), 13)
    }
}
