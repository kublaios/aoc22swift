//
// Created by Kubilay Erdogan on 2022-12-12.
//

import Foundation

enum Day11 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            calculate(worryLevelDivider: 3, numberOfRounds: 20)
        }

        private func calculate(worryLevelDivider: Int, numberOfRounds: Int) -> Int {
            var monkeys = inputProvider.input.components(separatedBy: "\n\n")
                .map { Monkey(rawInput: String($0)) }
            var inspectedItems = monkeys.map { _ -> Int in 0 }
            for _ in 0..<numberOfRounds {
                for i in 0..<monkeys.count {
                    let monkey = monkeys[i]
                    //   Monkey inspects an item with a worry level of 79.
                    //    Worry level is multiplied by 19 to 1501.
                    //    Monkey gets bored with item. Worry level is divided by 3 to 500.
                    //    Current worry level is not divisible by 23.
                    //    Item with worry level 500 is thrown to monkey 3.
                    for worryLevel in monkey.itemWorryLevels {
                        let newWorryLevel = monkey.worryLevelChange(worryLevel)
                        let boredWorryLevel = newWorryLevel / worryLevelDivider
                        if boredWorryLevel % monkey.decisionConstant == 0 {
                            monkeys[monkey.mostFavoriteMonkeyIndex].itemWorryLevels.append(boredWorryLevel)
                        } else {
                            monkeys[monkey.leastFavoriteMonkeyIndex].itemWorryLevels.append(boredWorryLevel)
                        }
                        inspectedItems[i] += 1
                    }
                    monkeys[i].itemWorryLevels.removeAll()
                }
            }
            // return the multipication of the max 2 items in inspectedItems
            return inspectedItems.sorted().suffix(2).reduce(1, *)
        }
    }
}
