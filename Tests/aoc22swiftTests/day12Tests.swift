//
// Created by Kubilay Erdogan on 2022-12-16.
//

import XCTest
@testable import aoc22swift

final class Day12Tests: XCTestCase {
    let input = """
                Sabqponm
                abcryxxl
                accszExk
                acctuvwj
                abdefghi
                """

    func testPartOne() {
        let solution = Day12.Solution(inputProvider: InputProvider(rawInput: input))
        XCTAssertEqual(solution.partOne(), 31)
    }

    func testPartTwo() {
        let solution = Day12.Solution(inputProvider: InputProvider(rawInput: input))
        XCTAssertEqual(solution.partTwo(), 29)
    }
}
