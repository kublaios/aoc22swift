//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum LineByLineSplitter {
    static func split(_ input: String) -> [String] {
        input.components(separatedBy: "\n")
    }
}