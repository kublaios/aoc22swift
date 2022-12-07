//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

struct InputProvider {
    let input: String

    init(file: String) {
        input = InputParser.parsedInput(file: file)
    }

    init(rawInput: String) {
        input = rawInput
    }
}
