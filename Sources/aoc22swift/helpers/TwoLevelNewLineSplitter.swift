//
// Created by Kubilay Erdogan on 2022-12-05.
//

import Foundation

struct TwoLevelNewLineSplitter {
    let input: String
    func split() -> [[String]] {
        input.components(separatedBy: "\n\n").map {
            $0.components(separatedBy: "\n")
        }
    }
}
