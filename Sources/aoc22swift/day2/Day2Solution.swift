//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum Day2 {
    struct Solution {
        let input: String

        init() {
            // URL of the file at root
            let url = URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .appendingPathComponent("input.txt")

            // Contents of the file
            let contents = try! String(contentsOf: url)

            input = contents
        }

        func partOne(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? input
            let lines = input.components(separatedBy: "\n")
            let points = lines.map { Day2.RPSRoundPlayerTwoPointsCalculator.calculatePlayerTwoPoints($0) }
            return points.reduce(0, +)
        }
    }

    enum RPSMove {
        case rock
        case paper
        case scissors
    }

    enum RPSResult {
        case win
        case lose
        case draw
    }

    enum RPSRoundPlayerTwoPointsCalculator {
        static func calculatePlayerTwoPoints(_ roundRaw: String) -> Int {
            let moves = RPSRoundMovesParser.parse(from: roundRaw)
            let result = RockPaperScissorsDeterminer.determinePlayerTwoResult(moves: moves)
            let pointsForResult = RPSRoundPlayerTwoPointsCalculator.pointsForResult(result)
            let pointsForMove = RPSRoundPlayerTwoPointsCalculator.pointsForMove(moves.1)
            return pointsForResult + pointsForMove
        }

        private static func pointsForResult(_ result: RPSResult) -> Int {
            switch result {
            case .win:
                return 6
            case .lose:
                return 0
            case .draw:
                return 3
            }
        }

        private static func pointsForMove(_ move: RPSMove) -> Int {
            switch move {
            case .rock:
                return 1
            case .paper:
                return 2
            case .scissors:
                return 3
            }
        }
    }

    enum RPSRoundMovesParser {
        static func parse(from string: String) -> (RPSMove, RPSMove) {
            let moves = string.components(separatedBy: " ").map { move -> RPSMove in
                switch move {
                case "A", "X":
                    return .rock
                case "B", "Y":
                    return .paper
                case "C", "Z":
                    return .scissors
                default:
                    fatalError("Invalid move: \(move)")
                }
            }
            return (moves[0], moves[1])
        }
    }

    enum RockPaperScissorsDeterminer {
        static func determinePlayerTwoResult(moves: (RPSMove, RPSMove)) -> RPSResult {
            let pOneMove = moves.0
            let pTwoMove = moves.1
            if pTwoMove == .rock && pOneMove == .scissors ||
                pTwoMove == .paper && pOneMove == .rock ||
                pTwoMove == .scissors && pOneMove == .paper {
                return .win
            } else if pOneMove == pTwoMove {
                return .draw
            } else {
                return .lose
            }
        }
    }
}