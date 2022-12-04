//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum Day3 {
    struct Solution {
        let input = InputParser.parseInput(from: #file)

        func partOne(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? input
            let lines = input.components(separatedBy: "\n")
            // Calculate the sum of priorities of common items in raw input
            let prioritySums = lines.map {
                RawItemsPriorityCalculator.calculatePriority(of: $0)
            }
            return prioritySums.reduce(0, +)
        }
    }

    enum StringSplitter {
        static func splitInHalf(_ string: String) -> (String, String) {
            let half = string.count / 2
            let firstHalf = string.prefix(half)
            let secondHalf = string.suffix(half)
            return (String(firstHalf), String(secondHalf))
        }
    }

    enum StringToCharArrayConverter {
        static func convert(_ string: String) -> [String] {
            Array(string.map { String($0) })
        }
    }

    enum CommonElementsFinder {
        static func findCommonElements(_ firstArray: [String], _ secondArray: [String]) -> [String] {
            var commonElements: [String] = []
            for element in firstArray {
                if secondArray.contains(element) {
                    commonElements.append(element)
                }
            }
            // Return unique elements
            return Array(Set(commonElements))
        }
    }

    enum CharacterPriorityProvider {
        /// Lowercase item types a through z have priorities 1 through 26.
        /// Uppercase item types A through Z have priorities 27 through 52.
        static func priority(of char: String) -> Int {
            let char = char.first!
            if char.isLowercase {
                return Int(char.asciiValue!) - 96
            } else {
                return Int(char.asciiValue!) - 64 + 26
            }
        }
    }

    enum RawItemsPriorityCalculator {
        static func calculatePriority(of input: String) -> Int {
            // Split string in half
            let (firstHalf, secondHalf) = StringSplitter.splitInHalf(input)
            // Convert strings to char arrays
            let firstHalfCharArray = StringToCharArrayConverter.convert(firstHalf)
            let secondHalfCharArray = StringToCharArrayConverter.convert(secondHalf)
            // Find common elements between char arrays
            let commonElements = CommonElementsFinder.findCommonElements(firstHalfCharArray, secondHalfCharArray)
            // Get the sum of priorities of common elements using CharacterPriorityProvider
            return commonElements.reduce(0) { $0 + CharacterPriorityProvider.priority(of: $1) }
        }
    }
}
