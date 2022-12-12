//
// Created by Kubilay Erdogan on 2022-12-12.
//

import XCTest
@testable import aoc22swift

final class CPUCommandTests: XCTestCase {
    func testInit() {
        let commands = [
            "addx -1",
            "addx 1",
            "addx 0",
            "noop",
        ]
        let expectedCommands = [
            CPUCommand.addx(-1),
            CPUCommand.addx(1),
            CPUCommand.addx(0),
            CPUCommand.noop,
        ]
        for (index, command) in commands.enumerated() {
            let cpuCommand = CPUCommand(command)
            XCTAssertEqual(cpuCommand, expectedCommands[index])
        }
    }
}

