//
// Created by Kubilay Erdogan on 2022-12-07.
//

import XCTest
@testable import aoc22swift

final class InputProviderTests: XCTestCase {
    func testParsesInput() {
        let input = InputProvider(file: #file).input
        XCTAssertEqual(input, "looking forward for your input!")
    }

    func testParsesRawInput() {
        let input = InputProvider(rawInput: "raw input").input
        XCTAssertEqual(input, "raw input")
    }
}
