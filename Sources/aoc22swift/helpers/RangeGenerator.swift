//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum RangeGenerator {
    static func generate(from string: String) -> ClosedRange<Int> {
        let components = string.components(separatedBy: "-")
        let lowerBound = Int(components[0])!
        let upperBound = Int(components[1])!
        return lowerBound...upperBound
    }
}
