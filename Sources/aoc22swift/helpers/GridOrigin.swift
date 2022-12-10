//
// Created by Kubilay Erdogan on 2022-12-10.
//

import Foundation

struct GridOrigin: Hashable {
    var x: Int
    var y: Int

    mutating func move(_ movement: GridMovement) -> Self {
        switch movement.direction {
        case .left:
            x -= movement.distance
        case .right:
            x += movement.distance
        case .up:
            y += movement.distance
        case .down:
            y -= movement.distance
        case .topLeft:
            x -= movement.distance
            y += movement.distance
        case .topRight:
            x += movement.distance
            y += movement.distance
        case .bottomLeft:
            x -= movement.distance
            y -= movement.distance
        case .bottomRight:
            x += movement.distance
            y -= movement.distance
        case .stayStill:
            break
        }
        return self
    }
}
