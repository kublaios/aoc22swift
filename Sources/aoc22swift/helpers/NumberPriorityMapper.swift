import Foundation

enum NumberPriorityMapper {
    static func mapPriorities(of grid: [[Character]]) -> [[Int]] {
        var priorityGrid = [[Int]]()
        for row in grid {
            var priorityRow = [Int]()
            for cell in row {
                priorityRow.append(AlphabetGridPriorityHelper.priority(of: cell))
            }
            priorityGrid.append(priorityRow)
        }
        return priorityGrid
    }
}
