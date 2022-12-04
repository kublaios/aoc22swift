//
// Created by Kubilay Erdogan on 2022-12-04.
//

import XCTest
@testable import aoc22swift

final class StringExploderTests: XCTestCase {
    func testStringExploderExplodesStringWithGivenSeparator() {
        let input = "1,2,3,4,5"
        let expected = ["1", "2", "3", "4", "5"]
        let actual = StringExploder.explode(input, by: ",")
        XCTAssertEqual(expected, actual)
    }
}
