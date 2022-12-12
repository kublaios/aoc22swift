//
// Created by Kubilay Erdogan on 2022-12-12.
//

import XCTest
@testable import aoc22swift

final class SpriteRendererTests: XCTestCase {
    func testRendersHorizontalLineAsBits() {
        // "..###"
        let renderer = SpriteRenderer(spritePosition: 3)
        let expected = [false, false, true, true, true]
        XCTAssertEqual(expected, renderer.horizontalLineAsBits)
    }

    func testRendersPositionOne() {
        // "###"
        let renderer = SpriteRenderer(spritePosition: 1)
        let expected = [true, true, true]
        XCTAssertEqual(expected, renderer.horizontalLineAsBits)
    }

    func testRendersPositionZero() {
        // "##"
        let renderer = SpriteRenderer(spritePosition: 0)
        let expected = [true, true]
        XCTAssertEqual(expected, renderer.horizontalLineAsBits)
    }

    func testRendersNegativePosition() {
        // ""
        let renderer = SpriteRenderer(spritePosition: -1)
        let expected: [Bool] = [true]
        XCTAssertEqual(expected, renderer.horizontalLineAsBits)
    }
}
