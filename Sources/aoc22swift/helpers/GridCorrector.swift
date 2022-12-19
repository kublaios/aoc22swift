import Foundation

enum GridCorrector {
    static func correct(grid: [[Character]]) -> [[Character]] {
        // Replace S with a and E with z
        var correctedGrid = grid
        for (y, row) in correctedGrid.enumerated() {
            for (x, cell) in row.enumerated() {
                if cell == "S" {
                    correctedGrid[y][x] = "a"
                }
                if cell == "E" {
                    correctedGrid[y][x] = "z"
                }
            }
        }
        return correctedGrid
    }
}
