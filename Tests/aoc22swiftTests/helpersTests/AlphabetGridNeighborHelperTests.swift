import XCTest
@testable import aoc22swift

final class AlphabetGridNeighborFinderTests: XCTestCase {
    func testFindsNeighborCoordinatesOnXAndYAxis() {
        let grid: [[Int]] = [
            [1, 1, 2, 17, 16, 15, 14, 13],
            [1, 2, 3, 18, 25, 24, 24, 12],
            [1, 3, 3, 19, 26, 26, 24, 11],
            [1, 3, 3, 20, 21, 22, 23, 10],
            [1, 2, 4, 5, 6, 7, 8, 9],
        ]
        let neighborFinder = AlphabetGridNeighborHelper(grid: grid)
        let neighbors = neighborFinder.neighborCoordinatesOnXAndYAxis(of: (x: 5, y: 2))
        XCTAssertEqual(neighbors.description, [(x: 4, y: 2), (x: 6, y: 2), (x: 5, y: 1), (x: 5, y: 3)].description)
    }
}
