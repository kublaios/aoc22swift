//
// Created by Kubilay Erdogan on 2022-12-10.
//

import XCTest
@testable import aoc22swift

final class GridOriginTests: XCTestCase {
    func testMovesOrigin() {
        var origins = [
            GridOrigin(x: 1, y: 2),
            GridOrigin(x: -1, y: -2),
            GridOrigin(x: 0, y: 0),
        ]
        let movements = [
            GridMovement(direction: .left, distance: 3),
            GridMovement(direction: .down, distance: 1),
            GridMovement(direction: .right, distance: 4),
        ]
        let expected = [
            GridOrigin(x: -2, y: 2),
            GridOrigin(x: -1, y: -3),
            GridOrigin(x: 4, y: 0),
        ]
        for i in 0..<origins.count {
            let origin = origins[i].move(movements[i])
            XCTAssertEqual(origin, expected[i])
        }
    }
}
