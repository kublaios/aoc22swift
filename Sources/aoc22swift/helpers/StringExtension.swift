//
// Created by Kubilay Erdogan on 2022-12-05.
//

import Foundation

extension String {
    func numbersInString() -> [Int] {
        let regex = try! NSRegularExpression(pattern: "\\d+")
        let matches = regex.matches(in: self, range: NSRange(location: 0, length: utf16.count))
        return matches.map { Int(self[Range($0.range, in: self)!])! }
    }
}
