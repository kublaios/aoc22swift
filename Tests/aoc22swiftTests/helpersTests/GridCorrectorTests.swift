import XCTest
@testable import aoc22swift

final class GridCorrectorTests: XCTestCase {
    func testCorrectsGrid() {
        let rawInput = """
                       Sa
                       ab
                       """

        let expected = [
            ["a", "a"],
            ["a", "b"]
        ]

        let grid = GridParser.parse(from: rawInput)
        let correctedGrid = GridCorrector.correct(grid: grid)
        XCTAssertEqual(correctedGrid.description, expected.description)
    }
}
