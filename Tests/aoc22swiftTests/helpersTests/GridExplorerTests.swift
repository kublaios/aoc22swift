import XCTest
@testable import aoc22swift

final class GridExplorerTests: XCTestCase {
    let rawInput = """
                   Sabqponm
                   abcryxxl
                   accszExk
                   acctuvwj
                   abdefghi
                   """

    func testInitializesWithUpdatedGridAndSourceTargetValues() {
        let grid = GridParser.parse(from: rawInput)
        let explorer = GridExplorer(grid: grid)

        XCTAssertEqual(explorer.source.x, 0)
        XCTAssertEqual(explorer.source.y, 0)

        XCTAssertEqual(explorer.target.x, 5)
        XCTAssertEqual(explorer.target.y, 2)

        let expectedGrid: [[Int]] = [
            [1, 1, 2, 17, 16, 15, 14, 13],
            [1, 2, 3, 18, 25, 24, 24, 12],
            [1, 3, 3, 19, 26, 26, 24, 11],
            [1, 3, 3, 20, 21, 22, 23, 10],
            [1, 2, 4, 5, 6, 7, 8, 9],
        ]
        XCTAssertEqual(explorer.grid, expectedGrid)
    }
}
