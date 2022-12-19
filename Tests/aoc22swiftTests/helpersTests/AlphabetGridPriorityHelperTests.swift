import XCTest
@testable import aoc22swift

final class AlphabetGridPriorityHelperTests: XCTestCase {
    func testPriorities() {
        let characters = ["a", "z", "k", "o"]
        let expected = [1, 26, 11, 15]

        for (index, character) in characters.enumerated() {
            XCTAssertEqual(AlphabetGridPriorityHelper.priority(of: Character(character)), expected[index])
        }
    }
}
