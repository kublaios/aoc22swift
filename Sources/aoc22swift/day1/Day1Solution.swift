//
// Created by Kubilay Erdogan on 2022-12-02.
//

import Foundation

enum Day1 {
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

        // Returns the highest sum in the given number chunks
        // Not super happy with overriding the input for tests but didn't want to over-engineer
        func partOne(_ overriddenInput: String? = nil) -> Int {
            convertInputIntoSumOfNumberChunks(input: overriddenInput ?? input).max()!
        }

        // Returns the sum of highest three numbers in the given number chunks
        func partTwo(_ overriddenInput: String? = nil ) -> Int {
            let totalNumbers = convertInputIntoSumOfNumberChunks(input: overriddenInput ?? input)
            return totalNumbers.sorted().suffix(3).reduce(0, +)
        }

        private func convertInputIntoSumOfNumberChunks(input: String) -> [Int] {
            let fileSplitter = Day1.TwoLevelNewLineSplitter(input: input)
            let nestedArrayIntegerMapper = Day1.NestedArrayIntegerMapper(input: fileSplitter.split())
            let innerIntegerArrayElementsReducer = Day1.InnerIntegerArrayElementsReducer(input: nestedArrayIntegerMapper.map())
            return innerIntegerArrayElementsReducer.reduce()
        }
    }

    struct TwoLevelNewLineSplitter {
        let input: String
        func split() -> [[String]] {
            input.components(separatedBy: "\n\n").map {
                $0.components(separatedBy: "\n")
            }
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
