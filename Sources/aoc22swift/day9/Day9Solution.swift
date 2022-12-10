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
            performCommandsOnOriginArray(ofSize: 2)
        }

        func partTwo() -> Int {
            performCommandsOnOriginArray(ofSize: 10)
        }

        private func performCommandsOnOriginArray(ofSize size: Int) -> Int {
            let movements = inputProvider.input.components(separatedBy: "\n").map { GridMovement(rawValue: $0) }

            // Create an array of origins with the given size
            let startOrigin = GridOrigin(x: 0, y: 0)
            var origins = (0..<size).map { _ -> GridOrigin in startOrigin }

            // Mark start origin as the first origin the tail of the array has been
            var originsTailHasBeen: Set<GridOrigin> = [startOrigin]

            for movement in movements {
                for _ in 0..<movement.distance {
                    var movementForNextOrigin = movement
                    // Move origins one point at a time so we can adjust the position of the elements based on the previous one
                    movementForNextOrigin.distance = 1
                    for i in 0..<origins.count {
                        // Apply direction to the current origin
                        origins[i] = origins[i].move(movementForNextOrigin)
                        // If there's a next origin available, override the direction so it can be applied in the next loop cycle
                        if origins.count > i + 1 {
                            if abs(origins[i].x - origins[i+1].x) > 1 || abs(origins[i].y - origins[i+1].y) > 1 {
                                movementForNextOrigin = GridMovement(from: origins[i+1], to: origins[i])
                            } else {
                                // If the points are adjacent on the same axis, do not move the following origin
                                movementForNextOrigin.direction = .stayStill
                            }
                        }
                    }
                    // Save the position of tale
                    originsTailHasBeen.insert(origins.last!)
                }
            }
            return originsTailHasBeen.count
        }
    }
}
