//
// Created by Kubilay Erdogan on 2022-12-06.
//

import Foundation

struct SubstringWithUniqueLettersDetector {
    let string: String

    /// Finds first n-letter substring which has different letters.
    func findFirstInstanceOfDifferentLetters(size: Int) -> Int {
        var index = 0
        while index < string.count - (size - 1) {
            let substring = string.map { String($0) }[index...index + (size - 1)]
            if substring.count == size {
                let set = Set(substring)
                if set.count == size {
                    return index
                }
            }
            index += 1
        }
        return -1
    }
}