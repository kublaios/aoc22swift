//
// Created by Kubilay Erdogan on 2022-12-06.
//

import Foundation

enum Day6 {
    struct Solution {
        func partOne(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? InputParser.parseInput(from: #file)
            let size = 4
            let indexOfSubstring = SubstringWithUniqueLettersDetector(string: input).findFirstInstanceOfDifferentLetters(size: size)
            return indexOfSubstring + size
        }

        func partTwo(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? InputParser.parseInput(from: #file)
            let size = 14
            let indexOfSubstring = SubstringWithUniqueLettersDetector(string: input).findFirstInstanceOfDifferentLetters(size: size)
            return indexOfSubstring + size
        }
    }
}