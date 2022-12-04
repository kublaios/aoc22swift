//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum Day4 {
    struct Solution {
        let input = InputParser.parseInput(from: #file)

        func partOne(_ overriddenInput: String? = nil) -> Int {
            let input = overriddenInput ?? input
            let lines = LineByLineSplitter.split(input)
            let rangeStrings = lines.map { StringExploder.explode($0, by: ",") }
            let ranges = rangeStrings.map { $0.map { RangeGenerator.generate(from: $0) } }
            return ranges.filter {
                if $0.count != 2 {
                    fatalError("Invalid input")
                }
                return Day4.isOneRangeWithinBoundsOfAnother($0[0], $0[1])
            }.count
        }
    }

    // MARK: Day one

    static func isOneRangeWithinBoundsOfAnother(_ one: ClosedRange<Int>, _ another: ClosedRange<Int>) -> Bool {
        (one.contains(another.lowerBound) && one.contains(another.upperBound))
        || (another.contains(one.lowerBound) && another.contains(one.upperBound))
    }
}
