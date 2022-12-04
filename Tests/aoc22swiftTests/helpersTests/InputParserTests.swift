//
// Created by Kubilay Erdogan on 2022-12-04.
//

import XCTest
@testable import aoc22swift

final class InputParserTests: XCTestCase {
    func testParsesInput() {
        let input = InputParser.parseInput(from: #file)
        XCTAssertEqual(input, "looking forward for your input!")
    }
}
