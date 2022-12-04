//
// Created by Kubilay Erdogan on 2022-12-04.
//

import XCTest
@testable import aoc22swift

final class day3Tests: XCTestCase {
    func testSolutionInitializes() {
        let solution = Day3.Solution()
        XCTAssertNotNil(solution)
    }

    // MARK: Part one

    func testStringSplitterSplitsInHalf() {
        let fullStrings = [
            "vJrwpWtwJgWrhcsFMMfFFhFp",
            "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
            "PmmdzqPrVvPwwTWBwg",
            "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
        ]
        let expectedStrings = [
            ("vJrwpWtwJgWr", "hcsFMMfFFhFp"),
            ("jqHRNqRjqzjGDLGL", "rsFMfFZSrLrFZsSL"),
            ("PmmdzqPrV", "vPwwTWBwg"),
            ("wMqvLMZHhHMvwLH", "jbvcjnnSBnvTQFn"),
        ]
        for (index, fullString) in fullStrings.enumerated() {
            let (firstHalf, secondHalf) = Day3.StringSplitter.splitInHalf(fullString)
            XCTAssertEqual(firstHalf, expectedStrings[index].0)
            XCTAssertEqual(secondHalf, expectedStrings[index].1)
        }
    }

    func testStringToCharArrayConverterConvertsStringToCharArray() {
        let fullStrings = [
            "vJrwpWtwJgWrhcsFMMfFFhFp",
            "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
            "PmmdzqPrVvPwwTWBwg",
            "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
        ]
        let expectedCharArrays = [
            ["v", "J", "r", "w", "p", "W", "t", "w", "J", "g", "W", "r", "h", "c", "s", "F", "M", "M", "f", "F", "F", "h", "F", "p"],
            ["j", "q", "H", "R", "N", "q", "R", "j", "q", "z", "j", "G", "D", "L", "G", "L", "r", "s", "F", "M", "f", "F", "Z", "S", "r", "L", "r", "F", "Z", "s", "S", "L"],
            ["P", "m", "m", "d", "z", "q", "P", "r", "V", "v", "P", "w", "w", "T", "W", "B", "w", "g"],
            ["w", "M", "q", "v", "L", "M", "Z", "H", "h", "H", "M", "v", "w", "L", "H", "j", "b", "v", "c", "j", "n", "n", "S", "B", "n", "v", "T", "Q", "F", "n"],
        ]
        for (index, fullString) in fullStrings.enumerated() {
            let charArray = Day3.StringToCharArrayConverter.convert(fullString)
            XCTAssertEqual(charArray, expectedCharArrays[index])
        }
    }

    func testCommonElementsFinderFindsCommonElementsBetweenTwoArrays() {
        let fullStrings = [
            "vJrwpWtwJgWrhcsFMMfFFhFp",
            "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
            "PmmdzqPrVvPwwTWBwg",
            "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
        ]
        let expectedCommonElements = [
            ["p"],
            ["L"],
            ["P"],
            ["v"],
        ]
        for (index, fullString) in fullStrings.enumerated() {
            let (firstHalf, secondHalf) = Day3.StringSplitter.splitInHalf(fullString)
            let firstHalfCharArray = Day3.StringToCharArrayConverter.convert(firstHalf)
            let secondHalfCharArray = Day3.StringToCharArrayConverter.convert(secondHalf)
            let commonElements = Day3.CommonElementsFinder.findCommonElements(firstHalfCharArray, secondHalfCharArray)
            XCTAssertEqual(commonElements, expectedCommonElements[index])
        }
    }

    func testCharacterPriorityProviderProvidesPriorityForChar() {
        // Priorities are 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s)
        let chars = ["p", "L", "P", "v", "t", "s"]
        let expectedPriorities = [16, 38, 42, 22, 20, 19]
        for (index, char) in chars.enumerated() {
            let priority = Day3.CharacterPriorityProvider.priority(of: char)
            XCTAssertEqual(priority, expectedPriorities[index])
        }
    }

    func testRawItemsPriorityCalculatorCalculatesPriorityOfElementsInGivenRawInput() {
        let fullStrings = [
            "vJrwpWtwJgWrhcsFMMfFFhFp",
            "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
            "PmmdzqPrVvPwwTWBwg",
            "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
            "ttgJtRGJQctTZtZT",
            "CrZsJsPPZsGzwwsLwLmpwMDw",
        ]
        let expectedPriorities = [16, 38, 42, 22, 20, 19]
        for (index, fullString) in fullStrings.enumerated() {
            let priority = Day3.RawItemsPriorityCalculator.calculatePriority(of: fullString)
            XCTAssertEqual(priority, expectedPriorities[index])
        }
    }

    func testSolutionPartOneCalculatesSumOfPrioritiesOfCommonElements() {
        let expectedTotalSum = 157
        let totalSum = Day3.Solution().partOne(
            """
            vJrwpWtwJgWrhcsFMMfFFhFp
            jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
            PmmdzqPrVvPwwTWBwg
            wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
            ttgJtRGJQctTZtZT
            CrZsJsPPZsGzwwsLwLmpwMDw
            """
        )
        XCTAssertEqual(totalSum, expectedTotalSum)
    }
}
