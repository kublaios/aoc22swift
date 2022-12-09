//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

struct IdentifiableDigitArrayScanner {
    enum Direction {
        case ltr, rtl
    }

    let array: [IdentifiableDigit]

    func visibleElements(direction: Direction = .ltr) -> [IdentifiableDigit] {
        var visibleElements: [IdentifiableDigit] = []
        var maxElement = -1
        let array = direction == .ltr ? array : array.reversed()
        for element in array {
            if element.digit > maxElement {
                visibleElements.append(element)
                maxElement = element.digit
            }
        }
        return visibleElements
    }
}
