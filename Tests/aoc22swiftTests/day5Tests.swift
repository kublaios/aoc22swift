//
// Created by Kubilay Erdogan on 2022-12-05.
//

import XCTest
@testable import aoc22swift

final class day5Tests: XCTestCase {
    // MARK: Part one

    func testSolutionPartOne() {
        let input = """
                        [D]    
                    [N] [C]    
                    [Z] [M] [P]
                     1   2   3 

                    move 1 from 2 to 1
                    move 3 from 1 to 3
                    move 2 from 2 to 1
                    move 1 from 1 to 2
                    """
        let solution = Day5.Solution(input)
        let result = solution.partOne()
        XCTAssertEqual(result, "CMZ")
    }

    func testLetterContainerBuilderBuildsContainers() {
        let input = """
                        [D]    
                    [N] [C]    
                    [Z] [M] [P]
                    """
        let expected = [
            ["N", "Z"],
            ["D", "C", "M"],
            ["P"],
        ]
        let result = Day5.LetterContainerBuilder.buildContainers(from: input.components(separatedBy: "\n"))
        XCTAssertEqual(result, expected)
    }

    func testInstructionsBuilderBuildsInstructions() {
        let input = """
                    move 1 from 2 to 1
                    move 3 from 1 to 3
                    move 2 from 2 to 1
                    move 1 from 1 to 2
                    """
        typealias Instruction = Day5.InstructionsBuilder.Instruction
        let expected = [
            Instruction(from: 2, to: 1, amount: 1),
            Instruction(from: 1, to: 3, amount: 3),
            Instruction(from: 2, to: 1, amount: 2),
            Instruction(from: 1, to: 2, amount: 1),
        ]
        let result = Day5.InstructionsBuilder.buildInstructions(from: input.components(separatedBy: "\n"))
        XCTAssertEqual(result, expected)
    }

    func testSolutionBuildsContainersAndInstructions() {
        let input = """
                        [D]    
                    [N] [C]    
                    [Z] [M] [P]
                     1   2   3 

                    move 1 from 2 to 1
                    move 3 from 1 to 3
                    move 2 from 2 to 1
                    move 1 from 1 to 2
                    """
        let containers = [
            ["N", "Z"],
            ["D", "C", "M"],
            ["P"],
        ]
        let instructions = [
            Day5.InstructionsBuilder.Instruction(from: 2, to: 1, amount: 1),
            Day5.InstructionsBuilder.Instruction(from: 1, to: 3, amount: 3),
            Day5.InstructionsBuilder.Instruction(from: 2, to: 1, amount: 2),
            Day5.InstructionsBuilder.Instruction(from: 1, to: 2, amount: 1),
        ]
        let solution = Day5.Solution(input)
        XCTAssertEqual(solution.containers, containers)
        XCTAssertEqual(solution.instructions, instructions)
    }

    func testSolutionRunsInstruction() {
        var containers = [
            ["N", "Z"],
            ["D", "C", "M"],
            ["P"],
        ]
        let instruction = Day5.InstructionsBuilder.Instruction(from: 2, to: 1, amount: 2)
        let expected = [
            ["C", "D", "N", "Z"],
            ["M"],
            ["P"],
        ]
        let solution = Day5.Solution()
        solution.runInstruction(instruction, on: &containers)
        XCTAssertEqual(containers, expected)
    }

    // MARK: Part two

    func testSolutionPartTwo() {
        let input = """
                        [D]    
                    [N] [C]    
                    [Z] [M] [P]
                     1   2   3 

                    move 1 from 2 to 1
                    move 3 from 1 to 3
                    move 2 from 2 to 1
                    move 1 from 1 to 2
                    """
        let solution = Day5.Solution(input)
        let result = solution.partTwo()
        XCTAssertEqual(result, "MCD")
    }
}