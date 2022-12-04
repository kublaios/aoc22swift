//
// Created by Kubilay Erdogan on 2022-12-04.
//

import XCTest
@testable import aoc22swift

final class LineByLineSplitterTests: XCTestCase {
    func testLineByLineSplitterSplitsLineByLine() {
        let input = """
                    2-4,6-8
                    2-3,4-5
                    5-7,7-9
                    2-8,3-7
                    6-6,4-6
                    2-6,4-8
                    """
        let expected = [
            "2-4,6-8",
            "2-3,4-5",
            "5-7,7-9",
            "2-8,3-7",
            "6-6,4-6",
            "2-6,4-8",
        ]
        let actual = LineByLineSplitter.split(input)
        XCTAssertEqual(expected, actual)
    }
}
