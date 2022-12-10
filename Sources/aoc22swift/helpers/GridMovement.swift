//
// Created by Kubilay Erdogan on 2022-12-10.
//

import Foundation

struct GridMovement: Equatable {
    enum Direction {
        case up
        case down
        case left
        case right
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
        case stayStill
    }

    var direction: Direction
    var distance: Int

    init(direction: Direction, distance: Int) {
        self.direction = direction
        self.distance = distance
    }

    init(rawValue string: String) {
        let data = string.components(separatedBy: " ")

        switch data[0] {
        case "U":
            direction = .up
        case "D":
            direction = .down
        case "L":
            direction = .left
        case "R":
            direction = .right
        default:
            fatalError("Invalid direction")
        }

        distance = Int(data[1])!
    }

    init(from: GridOrigin, to: GridOrigin, distance: Int = 1) {
        self.distance = distance

        if from.x == to.x && from.y == to.y {
            direction = .stayStill
        } else if from.x == to.x {
            if from.y < to.y {
                direction = .up
            } else {
                direction = .down
            }
        } else if from.y == to.y {
            if from.x < to.x {
                direction = .right
            } else {
                direction = .left
            }
        } else {
            switch (from.x - to.x, from.y - to.y) {
            case (1, 2), (2, 1), (2, 2):
                direction = .bottomLeft
            case (1, -2), (2, -1), (2, -2):
                direction = .topLeft
            case (-1, 2), (-2, 1), (-2, 2):
                direction = .bottomRight
            case (-1, -2), (-2, -1), (-2, -2):
                direction = .topRight
            default:
                direction = .stayStill
            }
        }
    }
}
