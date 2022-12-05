//
// Created by Kubilay Erdogan on 2022-12-05.
//

import XCTest
@testable import aoc22swift

final class TwoLevelNewLineSplitterTests: XCTestCase {
    func testFileSplitterSplitsUpToTwoLineBreaks() {
        let input = """
                    line1
                    line2
                    line3

                    line4

                    line5
                    line6
                    """
        let fileSplitter = TwoLevelNewLineSplitter(input: input)
        let expected = [["line1", "line2", "line3"], ["line4"], ["line5", "line6"]]
        let actual = fileSplitter.split()
        XCTAssertEqual(expected, actual)
    }
}
