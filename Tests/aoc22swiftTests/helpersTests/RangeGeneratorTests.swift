//
// Created by Kubilay Erdogan on 2022-12-04.
//

import XCTest
@testable import aoc22swift

final class RangeGeneratorTests: XCTestCase {
    func testRangedArrayGeneratorGeneratesFromGivenString() {
        let ranges = [
            "2-4",
            "1-3",
            "5-7",
            "8-10",
        ]
        let expected = [
            2...4,
            1...3,
            5...7,
            8...10,
        ]
        for (index, range) in ranges.enumerated() {
            let actual = RangeGenerator.generate(from: range)
            XCTAssertEqual(expected[index], actual)
        }
    }
}
