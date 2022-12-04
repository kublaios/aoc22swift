import XCTest
@testable import aoc22swift

final class day1Tests: XCTestCase {
    func testFileSplitterSplitsUpToTwoLineBreaks() {
        let input = """
                    line1
                    line2
                    line3

                    line4

                    line5
                    line6
                    """
        let fileSplitter = Day1.TwoLevelNewLineSplitter(input: input)
        let expected = [["line1", "line2", "line3"], ["line4"], ["line5", "line6"]]
        let actual = fileSplitter.split()
        XCTAssertEqual(expected, actual)
    }

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
        let solution = Day1.Solution()
        let expected = 24000
        let actual = solution.partOne("""
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
        XCTAssertEqual(expected, actual)
    }

    func testSolutionPartTwoReturnsSumOfHighestThreeNumbers() {
        let solution = Day1.Solution()
        let expected = 45000
        let actual = solution.partTwo("""
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
        XCTAssertEqual(expected, actual)
    }
}
