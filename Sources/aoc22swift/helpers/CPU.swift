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

    mutating func execute(_ commands: [CPUCommand]) {
        for command in commands {
            execute(command)
        }
    }

    mutating private func execute(_ command: CPUCommand) {
        switch command {
        case .noop:
            clock += 1
        case .addx(let value):
            clock += 1
            xRegister += value
            clock += 1
        }
    }
}
