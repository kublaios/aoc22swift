import XCTest
@testable import aoc22swift

final class day1Tests: XCTestCase {
    func testNestedArrayIntegerMapperMapsStringArrayToIntegerArray() {
        let input = [["1", "2", "3"], ["4", "5", "6"]]
        let nestedArrayIntegerMapper = Day1.NestedArrayIntegerMapper(input: input)
        let expected = [[1, 2, 3], [4, 5, 6]]
        let actual = nestedArrayIntegerMapper.map()
        XCTAssertEqual(expected, actual)
    }

    func testInnerIntegerArrayElementsReducerReducesInnerIntegerArrays() {
        let input = [[1, 2, 3], [4, 5, 6]]
        let innerIntegerArrayElementsReducer = Day1.InnerIntegerArrayElementsReducer(input: input)
        let expected = [6, 15]
        let actual = innerIntegerArrayElementsReducer.reduce()
        XCTAssertEqual(expected, actual)
    }

    func testSolutionPartOneReturnsHighestSum() {
        let inputProvider = InputProvider(rawInput: """
                                                    1000
                                                    2000
                                                    3000

                                                    4000

                                                    5000
                                                    6000

                                                    7000
                                                    8000
                                                    9000

                                                    10000
                                                    """)
        let solution = Day1.Solution(inputProvider: inputProvider)
        let expected = 24000
        let actual = solution.partOne()
        XCTAssertEqual(expected, actual)
    }

    func testSolutionPartTwoReturnsSumOfHighestThreeNumbers() {
        let inputProvider = InputProvider(rawInput: """
                                                    1000
                                                    2000
                                                    3000

                                                    4000

                                                    5000
                                                    6000

                                                    7000
                                                    8000
                                                    9000

                                                    10000
                                                    """)
        let solution = Day1.Solution(inputProvider: inputProvider)
        let expected = 45000
        let actual = solution.partTwo()
        XCTAssertEqual(expected, actual)
    }
}
