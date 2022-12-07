//
// Created by Kubilay Erdogan on 2022-12-02.
//

import Foundation

enum Day1 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        // Returns the highest sum in the given number chunks
        // Not super happy with overriding the input for tests but didn't want to over-engineer
        func partOne() -> Int {
            convertInputIntoSumOfNumberChunks(input: inputProvider.input).max()!
        }

        // Returns the sum of highest three numbers in the given number chunks
        func partTwo() -> Int {
            let totalNumbers = convertInputIntoSumOfNumberChunks(input: inputProvider.input)
            return totalNumbers.sorted().suffix(3).reduce(0, +)
        }

        private func convertInputIntoSumOfNumberChunks(input: String) -> [Int] {
            let fileSplitter = TwoLevelNewLineSplitter(input: input)
            let nestedArrayIntegerMapper = Day1.NestedArrayIntegerMapper(input: fileSplitter.split())
            let innerIntegerArrayElementsReducer = Day1.InnerIntegerArrayElementsReducer(input: nestedArrayIntegerMapper.map())
            return innerIntegerArrayElementsReducer.reduce()
        }
    }

    struct NestedArrayIntegerMapper {
        let input: [[String]]
        func map() -> [[Int]] {
            input.map {
                $0.map {
                    Int($0)!
                }
            }
        }
    }

    struct InnerIntegerArrayElementsReducer {
        let input: [[Int]]

        func reduce() -> [Int] {
            input.map {
                $0.reduce(0, +)
            }
        }
    }
}
