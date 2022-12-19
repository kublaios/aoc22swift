import XCTest
@testable import aoc22swift

final class GridParserTests: XCTestCase {
    let rawInput = """
                   Sabqponm
                   abcryxxl
                   accszExk
                   acctuvwj
                   abdefghi
                   """

    func testParse() {
        let grid = GridParser.parse(from: rawInput)
        XCTAssertEqual(grid.count, 5)
        XCTAssertEqual(grid[0], ["S", "a", "b", "q", "p", "o", "n", "m"])
        XCTAssertEqual(grid[1], ["a", "b", "c", "r", "y", "x", "x", "l"])
        XCTAssertEqual(grid[2], ["a", "c", "c", "s", "z", "E", "x", "k"])
        XCTAssertEqual(grid[3], ["a", "c", "c", "t", "u", "v", "w", "j"])
        XCTAssertEqual(grid[4], ["a", "b", "d", "e", "f", "g", "h", "i"])
    }
}
