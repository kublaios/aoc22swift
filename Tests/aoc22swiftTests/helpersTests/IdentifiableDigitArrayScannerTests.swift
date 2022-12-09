//
// Created by Kubilay Erdogan on 2022-12-09.
//

import XCTest
@testable import aoc22swift

final class IdentifiableDigitArrayScannerTests: XCTestCase {
    func testFindsNumberOfVisibleElements() {
        let arrays = [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]]
        let identifiableDigitArrays: [[IdentifiableDigit]] = arrays.map {
            $0.map { digit -> IdentifiableDigit in IdentifiableDigit(digit: digit) }
        }
        let expectionsLtr = [2, 2, 1, 3, 3]
        let expectionsRtl = [2, 2, 4, 1, 2]
        for (index, array) in identifiableDigitArrays.enumerated() {
            let scanner = IdentifiableDigitArrayScanner(array: array)
            XCTAssertEqual(scanner.visibleElements(direction: .ltr).count, expectionsLtr[index])
            XCTAssertEqual(scanner.visibleElements(direction: .rtl).count, expectionsRtl[index])
        }
    }
}
