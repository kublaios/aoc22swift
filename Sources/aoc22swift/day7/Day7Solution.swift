//
// Created by Kubilay Erdogan on 2022-12-08.
//

import Foundation

protocol StorageUnit {}

enum Day7 {
    struct Solution {
        let inputProvider: InputProvider

        init(inputProvider: InputProvider = InputProvider(file: #file)) {
            self.inputProvider = inputProvider
        }

        func partOne() -> Int {
            let allSizes = FlatFileTreeBuilder.build(input: inputProvider.input)
            // Sum of the sizes below 100000
            return allSizes.values.filter { $0 <= 100000 }.reduce(0, +)
        }

        func partTwo() -> Int {
            let allSizes = FlatFileTreeBuilder.build(input: inputProvider.input)
            // get the max
            let availableSpace = 70000000 - (allSizes.values.max() ?? 0)
            let requiredSpace = 30000000
            let neededSpace = requiredSpace - availableSpace
            // find the closest to the required space
            let closest = allSizes.values.sorted().first { $0 >= neededSpace } ?? 0
            return closest
        }
    }
}

extension Day7 {
    struct File: StorageUnit {
        let name: String
        let size: Int
    }

    struct Directory: StorageUnit {
        let name: String
        let size: Int
        let fullPath: String
        var children: [StorageUnit]
    }

    enum FlatFileTreeBuilder {
        static func build(input: String) -> [String: Int] {
            let lines = input.split(separator: "\n")
            var currentDirectory = ""
            var listing = false
            var flatTree: [String: Directory] = [:]

            for line in lines {
                if line.hasPrefix("$") {
                    // stop saving output for the listing if we receive a new command
                    listing = false
                }
                if line.hasPrefix("$ cd ") {
                    // build the full path if we cd into a directory and create dictionary entry if it doesn't exist
                    let direction = line.replacingOccurrences(of: "$ cd ", with: "")
                    if direction == "/" {
                        currentDirectory = "/"
                    } else if direction == ".." {
                        currentDirectory = currentDirectory.components(separatedBy: "/").dropLast(2).joined(separator: "/") + "/"
                    } else {
                        currentDirectory += direction + "/"
                    }
                    if flatTree[currentDirectory] == nil {
                        flatTree[currentDirectory] = Directory(name: direction, size: 0, fullPath: currentDirectory, children: [])
                    }
                } else if line.hasPrefix("$ ls") {
                    // start saving output for the listing
                    listing = true
                } else if listing {
                    // save the output for the listing
                    guard let currentUnit = flatTree[currentDirectory] else {
                        // sanity check
                        fatalError("No current unit")
                    }
                    let meta = line.components(separatedBy: " ")
                    let name = meta.last!
                    var children = currentUnit.children
                    if line.hasPrefix("dir ") {
                        let fullPath = currentDirectory + name + "/"
                        // Add current item to the children of the current directory
                        children.append(Directory(name: name, size: 0, fullPath: fullPath, children: []))
                        flatTree[currentDirectory]?.children = children
                    } else {
                        let size = Int(meta[0])!
                        // Add current item to the children of the current directory
                        children.append(File(name: name, size: size))
                        flatTree[currentDirectory]?.children = children
                    }
                }
            }

            // Correct the children of root elements
            flatTree = FlatTreeCorrector(flatTree: flatTree).correct()
            var sizesCalculated: [String: Int] = [:]
            let calculator = SizeCalculator(flatTree: flatTree)
            for (path, directory) in flatTree {
                sizesCalculated[path] = calculator.calculateSize(of: directory)
            }
            return sizesCalculated
        }
    }

    struct FlatTreeCorrector {
        let flatTree: [String: Directory]

        /// Loops through the root elements and attach them to their parents
        func correct() -> [String: Directory] {
            var correctedTree: [String: Directory] = flatTree
            for (path, directory) in flatTree {
                var children = directory.children
                for (index, child) in children.enumerated() {
                    if let child = child as? Directory,
                       let childDirectory = flatTree[child.fullPath] {
                        children[index] = childDirectory
                    }
                }
                correctedTree[path]?.children = children
            }
            return correctedTree
        }
    }

    struct SizeCalculator {
        let flatTree: [String: Directory]

        /// Calculates sizes of the directory by using flatTree as lookup table
        func calculateSize(of directory: Directory) -> Int {
            var size = 0
            if let dir = flatTree[directory.fullPath] {
                for child in dir.children {
                    if let child = child as? Directory {
                        size += calculateSize(of: child)
                    } else if let child = child as? File {
                        size += child.size
                    }
                }
            }
            return size
        }
    }
}
