//
// Created by Kubilay Erdogan on 2022-12-05.
//

import XCTest
@testable import aoc22swift

final class StringExtensionTests: XCTestCase {
    func testNumbersInString() {
        let input = "move 1 from 11 to 2"
        let expected = [1, 11, 2]
        let result = input.numbersInString()
        XCTAssertEqual(result, expected)
    }
}
