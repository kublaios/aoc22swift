//
// Created by Kubilay Erdogan on 2022-12-06.
//

import XCTest
@testable import aoc22swift

final class SubstringWithUniqueLettersDetectorTests: XCTestCase {
    func testFindFirstInstanceOfDifferentLetters() {
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
        let size = 14
        for (index, input) in inputs.enumerated() {
            let indexOfSubstring = SubstringWithUniqueLettersDetector(string: input).findFirstInstanceOfDifferentLetters(size: size)
            let result = indexOfSubstring + size
            XCTAssertEqual(result, expected[index])
        }
    }
}
