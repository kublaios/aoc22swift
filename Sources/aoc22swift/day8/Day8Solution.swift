//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

enum Day8 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let matrix = MatrixBuilder.buildMatrix(from: inputProvider.input)
            let horizontalVisibleElements = matrix.reduce([]) {
                $0 + IdentifiableDigitArrayScanner(array: $1).visibleElements() + IdentifiableDigitArrayScanner(array: $1).visibleElements(direction: .rtl)
            }
            let rotatedMatrix = MatrixRotator.rotate(matrix)
            let verticalVisibleElements = rotatedMatrix.reduce([]) {
                $0 + IdentifiableDigitArrayScanner(array: $1).visibleElements() + IdentifiableDigitArrayScanner(array: $1).visibleElements(direction: .rtl)
            }
            let visibleElements = Set(horizontalVisibleElements + verticalVisibleElements)
            return visibleElements.count
        }
    }
}
