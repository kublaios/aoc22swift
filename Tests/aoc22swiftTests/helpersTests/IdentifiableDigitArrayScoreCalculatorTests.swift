//
// Created by Kubilay Erdogan on 2022-12-09.
//

import XCTest
@testable import aoc22swift

final class IdentifiableDigitArrayScoreCalculatorTests: XCTestCase {
    func testVisibilityScores() {
        let array = [IdentifiableDigit(digit: 3),
                     IdentifiableDigit(digit: 5),
                     IdentifiableDigit(digit: 2),
                     IdentifiableDigit(digit: 8)]
        let scores = IdentifiableDigitArrayScoreCalculator.visibilityScores(for: array)
        XCTAssertEqual(scores, [0, 2, 1, 0])
    }
}
