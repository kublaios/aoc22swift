import XCTest
@testable import aoc22swift

final class aoc22swiftTests: XCTestCase {
    func testSolutionParsesInput() {
        XCTAssertNotEqual(Day2.Solution().input, "")
    }

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
        let expected = 15
        let actual = Day2.Solution().partOne(input)
        XCTAssertEqual(expected, actual)
    }
}