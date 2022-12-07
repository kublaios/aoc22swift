//
// Created by Kubilay Erdogan on 2022-12-05.
//

import XCTest
@testable import aoc22swift

final class day6Tests: XCTestCase {
    func testSolutionPartOne() {
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
            let result = Day6.Solution(inputProvider: InputProvider(rawInput: input)).partOne()
            XCTAssertEqual(result, expected[index])
        }
    }

    func testSolutionPartTwo() {
        let inputs = [
            "mjqjpqmgbljsphdztnvjfqwrcgsmlb",
            "bvwbjplbgvbhsrlpgdmjqwftvncz",
            "nppdvjthqldpwncqszvftbrmjlhg",
            "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg",
            "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw",
        ]
        let expected = [
            19,
            23,
            23,
            29,
            26,
        ]
        for (index, input) in inputs.enumerated() {
            let result = Day6.Solution(inputProvider: InputProvider(rawInput: input)).partTwo()
            XCTAssertEqual(result, expected[index])
        }
    }
}