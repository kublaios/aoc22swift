import Foundation

struct AlphabetGridNeighborHelper {
    let grid: [[Int]]

    func neighborCoordinatesOnXAndYAxis(of element: (x: Int, y: Int)) -> [(x: Int, y: Int)] {
        var neighbors: [(x: Int, y: Int)] = []
        if element.x > 0 {
            neighbors.append((x: element.x - 1, y: element.y))
        }
        if element.x < grid[0].count - 1 {
            neighbors.append((x: element.x + 1, y: element.y))
        }
        if element.y > 0 {
            neighbors.append((x: element.x, y: element.y - 1))
        }
        if element.y < grid.count - 1 {
            neighbors.append((x: element.x, y: element.y + 1))
        }
        return neighbors
    }
}
