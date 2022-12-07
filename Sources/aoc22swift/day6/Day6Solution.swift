//
// Created by Kubilay Erdogan on 2022-12-06.
//

import Foundation

enum Day6 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let input = inputProvider.input
            let size = 4
            let indexOfSubstring = SubstringWithUniqueLettersDetector(string: input).findFirstInstanceOfDifferentLetters(size: size)
            return indexOfSubstring + size
        }

        func partTwo() -> Int {
            let input = inputProvider.input
            let size = 14
            let indexOfSubstring = SubstringWithUniqueLettersDetector(string: input).findFirstInstanceOfDifferentLetters(size: size)
            return indexOfSubstring + size
        }
    }
}