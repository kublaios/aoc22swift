//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum StringExploder {
    static func explode(_ input: String, by: String) -> [String] {
        input.components(separatedBy: by)
    }
}
