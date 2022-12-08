//
// Created by Kubilay Erdogan on 2022-12-08.
//

import XCTest
@testable import aoc22swift

final class Day7Tests: XCTestCase {
    let input = """
                $ cd /
                $ ls
                dir a
                14848514 b.txt
                8504156 c.dat
                dir d
                $ cd a
                $ ls
                dir e
                29116 f
                2557 g
                62596 h.lst
                $ cd e
                $ ls
                584 i
                $ cd ..
                $ cd ..
                $ cd d
                $ ls
                4060174 j
                8033020 d.log
                5626152 d.ext
                7214296 k
                """

    func testSolutionPartOne() {
        let expected = 95437
        let result = Day7.Solution(inputProvider: InputProvider(rawInput: input)).partOne()
        XCTAssertEqual(result, expected)
    }
}
