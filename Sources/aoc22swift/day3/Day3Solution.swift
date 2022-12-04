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
            // Return grand total
            return prioritySums.reduce(0, +)
        }

        func partTwo(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? input
            // Read input line by line and group them into groups of 3
            let groups: [[String]] = StringArrayGrouper.group(array: input.components(separatedBy: "\n"), by: 3)
            var foundCommonItems: [String] = []
            // Loop throught each group and find common items within the group
            for group in groups {
                let groupCharArrays = group.map {
                    StringToCharArrayConverter.convert($0)
                }
                foundCommonItems.append(contentsOf: CommonElementsFinder.findCommonElementsIn(groupCharArrays))
            }
            // Calculate the sum of priorities of common items found in groups
            let prioritySums = foundCommonItems.map {
                CharacterPriorityProvider.priority(of: $0)
            }
            // Return grand total
            return prioritySums.reduce(0, +)
        }
    }

    // MARK: Part One

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
        // Day 1
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

        // Day 2
        static func findCommonElementsIn(rawInput input: String) -> [String] {
            // Split string in half
            let (firstHalf, secondHalf) = StringSplitter.splitInHalf(input)
            // Convert strings to char arrays
            let firstHalfCharArray = StringToCharArrayConverter.convert(firstHalf)
            let secondHalfCharArray = StringToCharArrayConverter.convert(secondHalf)

            return findCommonElementsIn([firstHalfCharArray, secondHalfCharArray])
        }

        static func findCommonElementsIn(_ arrays: [[String]]) -> [String] {
            var commonElements: [String] = []
            for array in arrays {
                if commonElements.isEmpty {
                    commonElements = array
                } else {
                    commonElements = findCommonElements(commonElements, array)
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
            let commonElements = CommonElementsFinder.findCommonElementsIn(rawInput: input)
            // Get the sum of priorities of common elements using CharacterPriorityProvider
            return commonElements.reduce(0) { $0 + CharacterPriorityProvider.priority(of: $1) }
        }
    }

    // MARK: Part Two

    enum StringArrayGrouper {
        static func group(array: [String], by: Int) -> [[String]] {
            var groups: [[String]] = []
            for (index, element) in array.enumerated() {
                if index % by == 0 {
                    groups.append([])
                }
                groups[groups.count - 1].append(element)
            }
            return groups
        }
    }
}
