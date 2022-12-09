//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

enum Day9 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = .init(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let commands = inputProvider.input.components(separatedBy: "\n").map { GridCommand(rawValue: $0) }

            var headOrigin = GridOrigin(x: 0, y: 0)
            var origins: Set<GridOrigin> = []
            origins.insert(headOrigin)

            var tailOrigin = headOrigin
            var originsTailHasBeen: Set<GridOrigin> = []
            originsTailHasBeen.insert(tailOrigin)

            for command in commands {
                for _ in 0..<command.distance {
                    let lastHeadOrigin = headOrigin
                    switch command.direction {
                    case .left:
                        headOrigin.x -= 1
                    case .right:
                        headOrigin.x += 1
                    case .up:
                        headOrigin.y += 1
                    case .down:
                        headOrigin.y -= 1
                    }
                    origins.insert(headOrigin)

                    if abs(headOrigin.x - tailOrigin.x) > 1 || abs(headOrigin.y - tailOrigin.y) > 1 {
                        tailOrigin = lastHeadOrigin
                        originsTailHasBeen.insert(tailOrigin)
                    }
                }
            }
            return originsTailHasBeen.count
        }
    }
}

// MARK: Nested types
extension Day9 {
    struct GridOrigin: Hashable {
        var x: Int
        var y: Int
    }

    struct GridCommand {
        enum Direction {
            case up
            case down
            case left
            case right
        }

        let direction: Direction
        let distance: Int

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
    }
}
