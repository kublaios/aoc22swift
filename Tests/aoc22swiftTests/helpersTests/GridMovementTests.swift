//
// Created by Kubilay Erdogan on 2022-12-10.
//

import XCTest
@testable import aoc22swift

final class GridMovementTests: XCTestCase {
    func testInitializesFromRawValue() {
        let input = """
                    R 4
                    U 4
                    L 3
                    D 1
                    R 4
                    D 1
                    L 5
                    R 2
                    """
        let rawValues = input.components(separatedBy: "\n")
        let expected = [
            GridMovement(direction: .right, distance: 4),
            GridMovement(direction: .up, distance: 4),
            GridMovement(direction: .left, distance: 3),
            GridMovement(direction: .down, distance: 1),
            GridMovement(direction: .right, distance: 4),
            GridMovement(direction: .down, distance: 1),
            GridMovement(direction: .left, distance: 5),
            GridMovement(direction: .right, distance: 2)
        ]
        for i in 0..<rawValues.count {
            let command = GridMovement(rawValue: rawValues[i])
            XCTAssertEqual(command, expected[i])
        }
    }

    func testInitializesWithDirection() {
        let fromOrigins = [
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 0),
        ]
        let toOrigins = [
            GridOrigin(x: 0, y: 0),
            GridOrigin(x: 0, y: 1),
            GridOrigin(x: 0, y: -1),
            GridOrigin(x: 1, y: 0),
            GridOrigin(x: -1, y: 0),
            GridOrigin(x: 2, y: 1),
            GridOrigin(x: 1, y: -2),
            GridOrigin(x: -2, y: 1),
            GridOrigin(x: -1, y: -2),
        ]
        let expected = [
            GridMovement(direction: .stayStill, distance: 1),
            GridMovement(direction: .up, distance: 1),
            GridMovement(direction: .down, distance: 1),
            GridMovement(direction: .right, distance: 1),
            GridMovement(direction: .left, distance: 1),
            GridMovement(direction: .topRight, distance: 1),
            GridMovement(direction: .bottomRight, distance: 1),
            GridMovement(direction: .topLeft, distance: 1),
            GridMovement(direction: .bottomLeft, distance: 1),
        ]
        for i in 0..<fromOrigins.count {
            let direction = GridMovement(from: fromOrigins[i], to: toOrigins[i])
            XCTAssertEqual(direction, expected[i])
        }
    }
}
