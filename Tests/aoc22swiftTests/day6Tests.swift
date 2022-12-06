//
// Created by Kubilay Erdogan on 2022-12-05.
//

import XCTest
@testable import aoc22swift

final class day6Tests: XCTestCase {
    // MARK: Part one

    func testSolutionPartOne() {
        let solution = Day6.Solution()
        let inputs = [
            "bvwbjplbgvbhsrlpgdmjqwftvncz",
            "nppdvjthqldpwncqszvftbrmjlhg",
            "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg",
            "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw",
        ]
        let expected = [
            5,
            6,
            10,
            11,
        ]
        for (index, input) in inputs.enumerated() {
            let result = solution.partOne(input)
            XCTAssertEqual(result, expected[index])
        }
    }
}