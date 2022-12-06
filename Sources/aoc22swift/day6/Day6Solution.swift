//
// Created by Kubilay Erdogan on 2022-12-06.
//

import Foundation

enum Day6 {
    struct Solution {
        func partOne(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? InputParser.parseInput(from: #file)
            let size = 4
            let result = findFirstInstanceOfDifferentLetters(input, ofSize: size) + size
            return result
        }

        /// Finds first n-letter substring which has different letters.
        private func findFirstInstanceOfDifferentLetters(_ input: String, ofSize size: Int) -> Int {
            var index = 0
            while index < input.count - (size - 1) {
                let substring = input.map { String($0) }[index...index + (size - 1)]
                if substring.count == size {
                    let set = Set(substring)
                    if set.count == size {
                        return index
                    }
                }
                index += 1
            }
            return -1
        }
    }
}