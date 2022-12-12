//
// Created by Kubilay Erdogan on 2022-12-12.
//

import XCTest
@testable import aoc22swift

final class MonkeyTests: XCTestCase {
    func testMonkeyInitializesFromRawInput() {
        let rawValues = [
            """
            Monkey 0:
              Starting items: 79, 98
              Operation: new = old * 19
              Test: divisible by 23
                If true: throw to monkey 2
                If false: throw to monkey 3
            """,
            """
            Monkey 1:
            Starting items: 54, 65, 75, 74
            Operation: new = old + 6
            Test: divisible by 19
              If true: throw to monkey 2
              If false: throw to monkey 0
            """,
            """
            Monkey 2:
            Starting items: 79, 60, 97
            Operation: new = old * old
            Test: divisible by 13
              If true: throw to monkey 1
              If false: throw to monkey 3
            """,
            """
            Monkey 3:
            Starting items: 74
            Operation: new = old + 3
            Test: divisible by 17
              If true: throw to monkey 0
              If false: throw to monkey 1
            """,
        ]
        let expectedMonkeys = [
            Monkey(itemWorryLevels: [79, 98], worryLevelChange: { $0 * 19 }, decisionConstant: 23, mostFavoriteMonkeyIndex: 2, leastFavoriteMonkeyIndex: 3),
            Monkey(itemWorryLevels: [54, 65, 75, 74], worryLevelChange: { $0 + 6 }, decisionConstant: 19, mostFavoriteMonkeyIndex: 2, leastFavoriteMonkeyIndex: 0),
            Monkey(itemWorryLevels: [79, 60, 97], worryLevelChange: { $0 * $0 }, decisionConstant: 13, mostFavoriteMonkeyIndex: 1, leastFavoriteMonkeyIndex: 3),
            Monkey(itemWorryLevels: [74], worryLevelChange: { $0 + 3 }, decisionConstant: 17, mostFavoriteMonkeyIndex: 0, leastFavoriteMonkeyIndex: 1),
        ]
        let monkeys = rawValues.map { Monkey(rawInput: $0) }
        XCTAssertEqual(monkeys, expectedMonkeys)

        // Assert that operation formula is parsed correctly
        let operationInputs = [ 79, 54, 79, 74 ]
        let operationOutputs = [ 79 * 19, 54 + 6, 79 * 79, 74 + 3 ]
        for (index, input) in operationInputs.enumerated() {
            XCTAssertEqual(monkeys[index].worryLevelChange(input), operationOutputs[index])
        }
    }
}
