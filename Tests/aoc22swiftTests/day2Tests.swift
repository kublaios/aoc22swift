import XCTest
@testable import aoc22swift

final class aoc22swiftTests: XCTestCase {
    func testSolutionParsesInput() {
        let expected = "looking forward for your input!"
        let actual = Day2.Solution().input
        XCTAssertEqual(expected, actual)
    }
}