//
// Created by Kubilay Erdogan on 2022-12-12.
//

import Foundation

struct CPU {
    var clock = 0 {
        didSet {
            xRegisterHistory.append(xRegister)
        }
    }
    var xRegister = 1
    var xRegisterHistory = [1]
    var clockObserver: ((Int, [Bool]) -> Void)?

    mutating func execute(_ commands: [CPUCommand]) {
        for command in commands {
            execute(command)
        }
    }

    mutating private func execute(_ command: CPUCommand) {
        func tick(operation: () -> Void = {}) {
            clockObserver?(clock, SpriteRenderer(spritePosition: xRegister).horizontalLineAsBits)
            // Each tick happens after the operation is done
            operation()
            clock += 1
        }

        switch command {
        case .noop:
            tick()
        case .addx(let value):
            tick()
            tick {
                xRegister += value
            }
        }
    }
}
