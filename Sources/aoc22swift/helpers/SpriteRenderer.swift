//
// Created by Kubilay Erdogan on 2022-12-12.
//

import Foundation

struct SpriteRenderer {
    let spritePosition: Int

    var horizontalLineAsBits: [Bool] {
        guard spritePosition > 0 else {
            switch spritePosition {
            case 0:
                return [true, true]
            case -1:
                return [true]
            default:
                return []
            }
        }
        var bits: [Bool] = []
        for _ in 0..<(spritePosition-1) {
            bits.append(false)
        }
        bits += [true, true, true]
        return bits
    }
}
