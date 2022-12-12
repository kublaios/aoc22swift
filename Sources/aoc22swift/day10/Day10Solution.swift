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

        func partTwo() -> String {
            let commands = inputProvider.input.components(separatedBy: "\n").map { CPUCommand($0) }
            var cpu = CPU()
            var output = ""
            cpu.clockObserver = { clock, bits in
                let column = clock % 40
                if column >= bits.count {
                    output += "."
                } else {
                    output += bits[column] ? "#" : "."
                }
            }
            cpu.execute(commands)
            // Add line break after every 40th character.
            var outputWithLineBreaks = ""
            for i in 0..<output.count {
                outputWithLineBreaks += String(output[output.index(output.startIndex, offsetBy: i)])
                if (i+1) % 40 == 0 {
                    outputWithLineBreaks += "\n"
                }
            }
            return outputWithLineBreaks
        }
    }
}
