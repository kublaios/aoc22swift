//
// Created by Kubilay Erdogan on 2022-12-12.
//

import XCTest
@testable import aoc22swift

final class CPUTests: XCTestCase {
    func testExecutesGivenCommands() {
        var cpu = CPU()
        let commands: [CPUCommand] = [
            .noop,
            .addx(1),
            .addx(0),
            .noop,
            .addx(-2),
        ]
        cpu.execute(commands)
        XCTAssertEqual(cpu.xRegister, 0)
        XCTAssertEqual(cpu.clock, 8)
        XCTAssertEqual(cpu.xRegisterHistory, [1, 1, 1, 2, 2, 2, 2, 2, 0])
    }
}