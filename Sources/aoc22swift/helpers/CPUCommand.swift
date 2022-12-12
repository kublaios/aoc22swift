//
// Created by Kubilay Erdogan on 2022-12-12.
//

import Foundation

enum CPUCommand: Equatable {
    case noop, addx(Int)

    init(_ command: String) {
        let parts = command.components(separatedBy: " ")
        switch parts[0] {
        case "noop":
            self = .noop
        case "addx":
            self = .addx(Int(parts[1])!)
        default:
            fatalError("Unknown command: \(command)")
        }
    }
}
