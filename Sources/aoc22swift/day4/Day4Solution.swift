//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum Day4 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let ranges = rangeDuosFromInput(input: inputProvider.input)
            return ranges.filter {
                    if $0.count != 2 {
                        fatalError("Invalid input")
                    }
                    return Day4.isOneRangeWithinBoundsOfAnother($0[0], $0[1])
                }.count
        }

        func partTwo() -> Int {
            let ranges = rangeDuosFromInput(input: inputProvider.input)
            return ranges.filter {
                    if $0.count != 2 {
                        fatalError("Invalid input")
                    }
                    return Day4.areTwoRangesOverlapping($0[0], $0[1])
                }.count
        }
    }

    // MARK: Day one

    static func isOneRangeWithinBoundsOfAnother(_ one: ClosedRange<Int>, _ another: ClosedRange<Int>) -> Bool {
        (one.contains(another.lowerBound) && one.contains(another.upperBound))
        || (another.contains(one.lowerBound) && another.contains(one.upperBound))
    }

    // MARK: Day two

    static func areTwoRangesOverlapping(_ one: ClosedRange<Int>, _ another: ClosedRange<Int>) -> Bool {
        if one.contains(another.lowerBound) || one.contains(another.upperBound) {
            return true
        } else if another.contains(one.lowerBound) || another.contains(one.upperBound) {
            return true
        }
        return false
    }

    static func rangeDuosFromInput(input: String) -> [[ClosedRange<Int>]] {
        let lines = LineByLineSplitter.split(input)
        let rangeStrings = lines.map { StringExploder.explode($0, by: ",") }
        return rangeStrings.map { $0.map { RangeGenerator.generate(from: $0) } }
    }
}
