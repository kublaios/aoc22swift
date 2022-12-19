import XCTest
@testable import aoc22swift

final class NumberPriorityMapperTests: XCTestCase {
	func testMapsPriorities() {
		let grid: [[Character]] = [["a", "b", "c", "z"]]
		let expected: [[Int]] = [[1, 2, 3, 26]]
		let result = NumberPriorityMapper.mapPriorities(of: grid)
		XCTAssertEqual(result.description, expected.description)
	}
}
