//
// Created by Kubilay Erdogan on 2022-12-16.
//

import Foundation

enum Day12 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let grid = GridParser.parse(from: inputProvider.input)
            let explorer = GridExplorer(grid: grid)
            return explorer.shortestDistanceFromSourceToTarget()
        }
    }
}
