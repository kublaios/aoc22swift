//
// Created by Kubilay Erdogan on 2022-12-05.
//

import Foundation

enum Day5 {
    struct Solution {
        let containers: [[String]]
        let instructions: [InstructionsBuilder.Instruction]
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
            let data = TwoLevelNewLineSplitter(input: inputProvider.input).split()
            if data.count == 2 {
                // Drop last line which contains the footer
                containers = LetterContainerBuilder.buildContainers(from: data[0].dropLast(1))
                instructions = InstructionsBuilder.buildInstructions(from: data[1])
            } else {
                containers = []
                instructions = []
            }
        }

        func partOne() -> String {
            var containers = containers
            instructions.forEach {
                runInstruction($0, on: &containers)
            }
            // Concatenate first element of each container
            return containers.map { $0[0] }.joined()
        }

        func partTwo() -> String {
            var containers = containers
            instructions.forEach {
                runInstructionWithPreservedOrder($0, on: &containers)
            }
            // Concatenate first element of each container
            return containers.map { $0[0] }.joined()
        }

        func runInstruction(_ instruction: InstructionsBuilder.Instruction, on containers: inout [[String]]) {
            let fromContainer = containers[instruction.from - 1]
            let toContainer = containers[instruction.to - 1]
            // Move elements as if one by one where first in deepest in the stack
            let letters = fromContainer.prefix(instruction.amount).reversed()
            containers[instruction.from - 1] = Array(fromContainer.dropFirst(instruction.amount))
            containers[instruction.to - 1] = letters + toContainer
        }

        func runInstructionWithPreservedOrder(_ instruction: InstructionsBuilder.Instruction, on containers: inout [[String]]) {
            let fromContainer = containers[instruction.from - 1]
            let toContainer = containers[instruction.to - 1]
            let letters = fromContainer.prefix(instruction.amount)
            containers[instruction.from - 1] = Array(fromContainer.dropFirst(instruction.amount))
            containers[instruction.to - 1] = letters + toContainer
        }
    }

    // MARK: Part one

    enum LetterContainerBuilder {
        static func buildContainers(from lines: [String]) -> [[String]] {
            let containers = lines.map { line -> [String] in
                var currentItem = ""
                var items: [String] = []
                for char in line {
                    currentItem += String(char)
                    if currentItem.count == 4 {
                        items.append(currentItem.trimmingCharacters(in: .whitespaces))
                        currentItem = ""
                    }
                }
                items.append(currentItem.trimmingCharacters(in: .whitespaces))
                return items
                    .map { removeBrackets(from: $0) }
            }
            // convert horizontal arrays to vertical arrays
            var result: [[String]] = []
            for i in 0..<containers.count {
                for j in 0..<containers[i].count {
                    if result.count <= j {
                        result.append([])
                    }
                    result[j].append(containers[i][j])
                }
            }
            // remove empty elements in two dimensional array
            return result
                .map { $0.filter { !$0.isEmpty } }
        }

        private static func removeBrackets(from input: String) -> String {
            input.replacingOccurrences(of: "[", with: "")
                .replacingOccurrences(of: "]", with: "")
        }
    }

    enum InstructionsBuilder {
        struct Instruction: Equatable {
            let from: Int
            let to: Int
            let amount: Int
        }

        static func buildInstructions(from lines: [String]) -> [Instruction] {
            lines.map {
                let values = $0.numbersInString()
                return Instruction(from: values[1], to: values[2], amount: values[0])
            }
        }
    }
}
