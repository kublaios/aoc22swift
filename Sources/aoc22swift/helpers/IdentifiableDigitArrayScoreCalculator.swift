//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

enum IdentifiableDigitArrayScoreCalculator {
    /// Iterates through each element and calculates visibility score by multiplying the number of elements
    /// on the left and right until an equal or greater digit is encountered.
    static func visibilityScores(for array: [IdentifiableDigit]) -> [Int] {
        var scores = [Int](repeating: 0, count: array.count)
        for (index, element) in array.enumerated() {
            let rtlElements = array[0..<index].reversed()
            var visibleElementsOnLeft = 0
            for el in rtlElements {
                visibleElementsOnLeft += 1
                if el.digit >= element.digit {
                    break
                }
            }
            let ltrElements = array[index+1..<array.count]
            var visibleElementsOnRight = 0
            for el in ltrElements {
                visibleElementsOnRight += 1
                if el.digit >= element.digit {
                    break
                }
            }
            scores[index] = visibleElementsOnLeft * visibleElementsOnRight
        }
        return scores
    }
}
