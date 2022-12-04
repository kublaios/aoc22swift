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

        func partTwo(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? input
            let lines = input.components(separatedBy: "\n")
            let points = lines.map { Day2.RPSRoundPlayerTwoPointsCalculator.calculatePlayerTwoPoints($0, correctMoves: true) }
            return points.reduce(0, +)
        }
    }

    enum RPSMove: String {
        case rock = "A"
        case paper = "B"
        case scissors = "C"

        func requiredOpponentMove(for result: RPSResult) -> RPSMove {
            switch result {
            case .win:
                switch self {
                case .rock:
                    return .paper
                case .paper:
                    return .scissors
                case .scissors:
                    return .rock
                }
            case .lose:
                switch self {
                case .rock:
                    return .scissors
                case .paper:
                    return .rock
                case .scissors:
                    return .paper
                }
            case .draw:
                return self
            }
        }
    }

    enum RPSResult: String {
        case lose = "X"
        case draw = "Y"
        case win = "Z"
    }

    // MARK: Part one helpers

    enum RPSRoundPlayerTwoPointsCalculator {
        static func calculatePlayerTwoPoints(_ roundRaw: String, correctMoves: Bool = false) -> Int {
            let round = correctMoves ? RPSRoundMovesRawDataCorrector.correctMoves(from: roundRaw) : roundRaw
            let moves = RPSRoundMovesParser.parse(from: round)
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

    // MARK: Part two helpers

    enum RPSRoundParser {
        static func parse(from string: String) -> (RPSMove, RPSResult) {
            let components = string.components(separatedBy: " ")
            let move = RPSRoundParser.move(from: components[0])
            let result = RPSRoundParser.result(from: components[1])
            return (move, result)
        }

        private static func move(from string: String) -> RPSMove {
            switch string {
            case "A":
                return .rock
            case "B":
                return .paper
            case "C":
                return .scissors
            default:
                fatalError("Invalid move: \(string)")
            }
        }

        private static func result(from string: String) -> RPSResult {
            switch string {
            case "X":
                return .lose
            case "Y":
                return .draw
            case "Z":
                return .win
            default:
                fatalError("Invalid result: \(string)")
            }
        }
    }

    enum RPSRoundMovesRawDataCorrector {
        static func correctMoves(from string: String) -> String {
            let roundData = RPSRoundParser.parse(from: string)
            let move = roundData.0
            let result = roundData.1
            let opponentMove = move.requiredOpponentMove(for: result)
            return "\(move.rawValue) \(opponentMove.rawValue)"
        }
    }
}