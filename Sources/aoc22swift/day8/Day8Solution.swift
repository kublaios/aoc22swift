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

        func partTwo() -> Int {
            let matrix = MatrixBuilder.buildMatrix(from: inputProvider.input)
            let horizontalVisibilityScores = matrix.map {
                IdentifiableDigitArrayScoreCalculator.visibilityScores(for: $0)
            }
            let rotatedMatrix = MatrixRotator.rotate(matrix)
            let verticalVisibilityScores = rotatedMatrix.map {
                IdentifiableDigitArrayScoreCalculator.visibilityScores(for: $0)
            }
            // Undo rotation on vertical visibility scores so we can multiply them with horizontal visibility scores.
            let verticalVisibilityScoresDeRotated = MatrixRotator.rotate(verticalVisibilityScores)
            // multiply two matrices
            let result = zip(horizontalVisibilityScores, verticalVisibilityScoresDeRotated).map {
                zip($0, $1).map {
                    $0 * $1
                }
            }
            // return the highest value
            return result.flatMap({ $0 }).max() ?? 0
        }
    }
}
