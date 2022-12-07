import XCTest
@testable import aoc22swift

final class aoc22swiftTests: XCTestCase {
    // MARK: Part one tests

    func testRockPaperScissorsDeterminerDeterminesWinner() {
        let inputRaw = """
                       A Y
                       B X
                       C Z
                       """
        // Split raw input line by line
        let input = inputRaw.components(separatedBy: "\n")
        let expected: [Day2.RPSResult] = [
            .win,
            .lose,
            .draw
        ]
        for (index, line) in input.enumerated() {
            let moves = Day2.RPSRoundMovesParser.parse(from: line)
            let result = Day2.RockPaperScissorsDeterminer.determinePlayerTwoResult(moves: moves)
            XCTAssertEqual(expected[index], result)
        }
    }

    func testRPSRoundPlayerTwoPointsCalculatorCalculatesPoints() {
        let inputRaw = """
                       A Y
                       B X
                       C Z
                       """
        // Split raw input line by line
        let input = inputRaw.components(separatedBy: "\n")
        let expected: [Int] = [
            8,
            1,
            6
        ]
        for (index, line) in input.enumerated() {
            let points = Day2.RPSRoundPlayerTwoPointsCalculator.calculatePlayerTwoPoints(line)
            XCTAssertEqual(expected[index], points)
        }
    }

    func testSolutionPartOneCalculatesPlayerTwoPoints() {
        let input = """
                    A Y
                    B X
                    C Z
                    """
        let inputProvider = InputProvider(rawInput: input)
        let expected = 15
        let actual = Day2.Solution(inputProvider: inputProvider).partOne()
        XCTAssertEqual(expected, actual)
    }

    // MARK: Part two tests

    func testRPSRoundMovesRawDataCorrectorCorrectsMoves() {
        let inputRaw = """
                       A Y
                       B X
                       C Z
                       """
        // Split raw input line by line
        let input = inputRaw.components(separatedBy: "\n")
        let expected: [String] = [
            "A A",
            "B A",
            "C A"
        ]
        for (index, line) in input.enumerated() {
            let corrected = Day2.RPSRoundMovesRawDataCorrector.correctMoves(from: line)
            XCTAssertEqual(expected[index], corrected)
        }
    }

    func testSolutionPartTwoCalculatesPlayerTwoPoints() {
        let input = """
                    A Y
                    B X
                    C Z
                    """
        let inputProvider = InputProvider(rawInput: input)
        let expected = 12
        let actual = Day2.Solution(inputProvider: inputProvider).partTwo()
        XCTAssertEqual(expected, actual)
    }
}