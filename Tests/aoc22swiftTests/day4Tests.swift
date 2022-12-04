//
// Created by Kubilay Erdogan on 2022-12-04.
//

import XCTest
@testable import aoc22swift

final class day4Tests: XCTestCase {
    func testSolutionInitializes() {
        let solution = Day4.Solution()
        XCTAssertNotNil(solution)
    }

    // MARK: Day one

    func testIsOneRangeWithinBoundsOfAnotherReturnsTrueWhenOneRangeIsWithinBoundsOfAnother() {
        let pairs = [
            (1...3, 2...4),
            (2...4, 2...3),
            (6...8, 5...9),
            (6...7, 6...7),
            (6...7, 6...8),
            (6...8, 5...7),
        ]
        let expectations = [
            false,
            true,
            true,
            true,
            true,
            false
        ]
        for (index, pair) in pairs.enumerated() {
            let actual = Day4.isOneRangeWithinBoundsOfAnother(pair.0, pair.1)
            XCTAssertEqual(expectations[index], actual, "Failed for \(pair.0) and \(pair.1)")
        }
    }

    func testPartOne() {
        let input = """
                    2-4,6-8
                    2-3,4-5
                    5-7,7-9
                    2-8,3-7
                    6-6,4-6
                    2-6,4-8
                    """
        let expected = 2
        let solution = Day4.Solution()
        let actual = solution.partOne(input)
        XCTAssertEqual(expected, actual)
    }

    // MARK: Part two

    func testAreRangesOverlappingDetectsOverlappingRanges() {
        let pairs = [
            (1...3, 2...4),
            (2...4, 2...3),
            (6...8, 5...9),
            (6...7, 6...7),
            (6...7, 6...8),
            (6...8, 5...7),
            (3...5, 2...3),
            (1...2, 5...9),
            (4...6, 2...3),
            (2...4, 6...8),
            (2...3, 4...5),
            (5...7, 7...9),
            (2...8, 3...7),
            (6...6, 4...6),
            (2...6, 4...8),
        ]
        let expectations = [
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            false,
            false,
            false,
            false,
            true,
            true,
            true,
            true,
        ]
        for (index, pair) in pairs.enumerated() {
            let actual = Day4.areTwoRangesOverlapping(pair.0, pair.1)
            XCTAssertEqual(expectations[index], actual, "Failed for \(pair.0) and \(pair.1)")
        }
    }

    func testPartTwo() {
        let input = """
                    2-4,6-8
                    2-3,4-5
                    5-7,7-9
                    2-8,3-7
                    6-6,4-6
                    2-6,4-8
                    """
        let expected = 4
        let solution = Day4.Solution()
        let actual = solution.partTwo(input)
        XCTAssertEqual(expected, actual)
    }
}
