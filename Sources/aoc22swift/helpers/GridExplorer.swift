import Foundation

// By courtesy of https://levelup.gitconnected.com/dijkstras-shortest-path-algorithm-in-a-grid-eb505eb3a290
struct GridExplorer {
    var grid: [[Int]]
    let source: (x: Int, y: Int)
    let target: (x: Int, y: Int)

    init(grid: [[Character]]) {
        var source: (x: Int, y: Int)?
        var target: (x: Int, y: Int)?
        for (y, row) in grid.enumerated() {
            for (x, cell) in row.enumerated() {
                if cell == "S" {
                    source = (x: x, y: y)
                }
                if cell == "E" {
                    target = (x: x, y: y)
                }
                if source != nil && target != nil {
                    break
                }
            }
        }
        self.source = source ?? (x: 0, y: 0)
        self.target = target ?? (x: 0, y: 0)
        self.grid = NumberPriorityMapper.mapPriorities(of: GridCorrector.correct(grid: grid))
    }

    func shortestDistanceFromSourceToTarget() -> Int {
        let startingPath = [source]
        return branchOut(from: [startingPath]).count - 1 // Minus one for the source
    }

    func shortestDistanceFromTargetUntil(priority: Int) -> Int {
        let startingPath = [target]
        return branchBackwards(from: [startingPath], untilReachingPriority: priority).count - 1 // Minus one for the target
    }

    // RIP Edsger Wybe Dijkstra 🧡
    private func branchOut(from paths:[[(x: Int, y: Int)]], visitedNodes: [(x: Int, y: Int)] = []) -> [(x: Int, y: Int)] {
        var pathsMutable = paths
        var visitedNodesMutable = visitedNodes
        let firstPath = paths.first!
        let lastNode = firstPath.last!
        let lastNodePriority = grid[lastNode.y][lastNode.x]
        for node in AlphabetGridNeighborHelper.init(grid: grid).neighborCoordinatesOnXAndYAxis(of: lastNode) {
            guard grid[node.y][node.x] <= lastNodePriority + 1
            else { continue }

            guard !visitedNodesMutable.contains(where: { $0 == node })
            else { continue }

            guard node != target else {
                return firstPath + [node]
            }

            visitedNodesMutable.append(node)
            pathsMutable += [firstPath + [node]]
        }

        pathsMutable.removeFirst()

        return branchOut(from: pathsMutable.sorted { $0.count < $1.count }, visitedNodes: visitedNodesMutable)
    }

    // RIP Edsger Wybe Dijkstra 🧡
    private func branchBackwards(from paths:[[(x: Int, y: Int)]], untilReachingPriority priority: Int, visitedNodes: [(x: Int, y: Int)] = []) -> [(x: Int, y: Int)] {
        var pathsMutable = paths
        var visitedNodesMutable = visitedNodes
        let firstPath = paths.first!
        let lastNode = firstPath.last!
        let lastNodePriority = grid[lastNode.y][lastNode.x]
        for node in AlphabetGridNeighborHelper.init(grid: grid).neighborCoordinatesOnXAndYAxis(of: lastNode) {
            let currentNodePriority = grid[node.y][node.x]
            guard currentNodePriority >= lastNodePriority - 1
            else { continue }

            guard !visitedNodesMutable.contains(where: { $0 == node })
            else { continue }

            guard currentNodePriority != priority
            else { return firstPath + [node] }

            visitedNodesMutable.append(node)
            pathsMutable += [firstPath + [node]]
        }

        pathsMutable.removeFirst()

        return branchBackwards(from: pathsMutable.sorted { $0.count < $1.count }, untilReachingPriority: priority, visitedNodes: visitedNodesMutable)
    }
}
