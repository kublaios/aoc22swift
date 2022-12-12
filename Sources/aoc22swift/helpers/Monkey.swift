//
// Created by Kubilay Erdogan on 2022-12-12.
//

import Foundation

struct Monkey: Equatable {
    static func ==(lhs: Monkey, rhs: Monkey) -> Bool {
        lhs.itemWorryLevels == rhs.itemWorryLevels &&
            lhs.decisionConstant == rhs.decisionConstant &&
            lhs.mostFavoriteMonkeyIndex == rhs.mostFavoriteMonkeyIndex &&
            lhs.leastFavoriteMonkeyIndex == rhs.leastFavoriteMonkeyIndex
    }

    var itemWorryLevels: [Int]
    let worryLevelChange: (Int) -> Int
    let decisionConstant: Int
    let mostFavoriteMonkeyIndex: Int
    let leastFavoriteMonkeyIndex: Int

    init(itemWorryLevels: [Int], worryLevelChange: @escaping (Int) -> Int, decisionConstant: Int, mostFavoriteMonkeyIndex: Int, leastFavoriteMonkeyIndex: Int) {
        self.itemWorryLevels = itemWorryLevels
        self.worryLevelChange = worryLevelChange
        self.decisionConstant = decisionConstant
        self.mostFavoriteMonkeyIndex = mostFavoriteMonkeyIndex
        self.leastFavoriteMonkeyIndex = leastFavoriteMonkeyIndex
    }

    /*
     Monkey 0:
      Starting items: 79, 98
      Operation: new = old * 19
      Test: divisible by 23
        If true: throw to monkey 2
        If false: throw to monkey 3
     */
    init(rawInput: String) {
        let input = rawInput.split(separator: "\n")
            .map { $0.replacingOccurrences(of: " ", with: "") }
            .dropFirst()
            .map { String($0.split(separator: ":")[1]) }

        // MARK: - Item Worry Levels
        itemWorryLevels = input[0].split(separator: ",").map { Int($0)! }

        // MARK: - Worry Level Change
        let worryLevelChangeFormula = String(input[1].split(separator: "=")[1])
        let worryLevelChangeFormulaOperand = worryLevelChangeFormula.contains("*") ? "*" : "+"
        let worryLevelChangeFormulaParts: [String]
        if worryLevelChangeFormulaOperand == "*" {
            worryLevelChangeFormulaParts = worryLevelChangeFormula.split(separator: "*").map { String($0) }
        } else {
            worryLevelChangeFormulaParts = worryLevelChangeFormula.split(separator: "+").map { String($0) }
        }

        switch (worryLevelChangeFormulaParts[0], worryLevelChangeFormulaParts[1]) {
        case ("old", "old"):
            if worryLevelChangeFormulaOperand == "*" {
                worryLevelChange = { $0 * $0 }
            } else {
                worryLevelChange = { $0 + $0 }
            }
        case (_, "old"):
            if worryLevelChangeFormulaOperand == "*" {
                worryLevelChange = { Int(worryLevelChangeFormulaParts[0])! * $0 }
            } else {
                worryLevelChange = { Int(worryLevelChangeFormulaParts[0])! + $0 }
            }
        case ("old", _):
            if worryLevelChangeFormulaOperand == "*" {
                worryLevelChange = { $0 * Int(worryLevelChangeFormulaParts[1])! }
            } else {
                worryLevelChange = { $0 + Int(worryLevelChangeFormulaParts[1])! }
            }
        default:
            fatalError("Invalid worry level change formula.")
        }

        // MARK: - Decision Constant
        decisionConstant = Int(input[2].replacingOccurrences(of: "divisibleby", with: ""))!

        // MARK: - Most Favorite Monkey Index
        mostFavoriteMonkeyIndex = Int(input[3].replacingOccurrences(of: "throwtomonkey", with: ""))!

        // MARK: - Least Favorite Monkey Index
        leastFavoriteMonkeyIndex = Int(input[4].replacingOccurrences(of: "throwtomonkey", with: ""))!
    }
}