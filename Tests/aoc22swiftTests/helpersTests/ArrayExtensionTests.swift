//
// Created by Kubilay Erdogan on 2022-12-05.
//

import XCTest
@testable import aoc22swift

final class ArrayExtensionTests: XCTestCase {
    func testTransferFirstItem() {
        var firstArray = ["N", "Z"]
        var secondArray = ["D", "C", "M"]
        let expectedFirst = ["Z"]
        let expectedSecond = ["N", "D", "C", "M"]
        firstArray.transferFirstItem(to: &secondArray)
        XCTAssertEqual(firstArray, expectedFirst)
        XCTAssertEqual(secondArray, expectedSecond)
    }

    func testPrepend() {
        var array = ["N", "Z"]
        let expected = ["D", "N", "Z"]
        array.prepend("D")
        XCTAssertEqual(array, expected)
    }
}
