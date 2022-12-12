//
// Created by Kubilay Erdogan on 2022-12-11.
//

import Foundation

enum Day10 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let commands = inputProvider.input.components(separatedBy: "\n").map { CPUCommand($0) }
            var cpu = CPU()
            cpu.execute(commands)
            var sumOfXRegisters = 0

            // Add the value of every 40th register after 20th register.
            let startingIndex = 20
            for i in 0..<220 {
                let xRegisterValue = cpu.xRegisterHistory[i]
                if i+1 == startingIndex {
                    sumOfXRegisters += (i+1) * xRegisterValue
                } else if ((i+1) - startingIndex) % 40 == 0 {
                    sumOfXRegisters += (i+1) * xRegisterValue
                }
            }

            return sumOfXRegisters
        }
    }
}
