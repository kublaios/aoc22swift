//
// Created by Kubilay Erdogan on 2022-12-09.
//

import XCTest
@testable import aoc22swift

final class Day8Tests: XCTestCase {
    func testSolutionPartOne() {
        let input = """
                    30373
                    25512
                    65332
                    33549
                    35390
                    """
        let solution = Day8.Solution(inputProvider: InputProvider(rawInput: input))
        XCTAssertEqual(solution.partOne(), 21)
    }
}
