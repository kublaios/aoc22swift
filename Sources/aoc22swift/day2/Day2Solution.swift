//
// Created by Kubilay Erdogan on 2022-12-04.
//

import Foundation

enum Day2 {
    struct Solution {
        let input: String

        init() {
            // URL of the file at root
            let url = URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .appendingPathComponent("input.txt")

            // Contents of the file
            let contents = try! String(contentsOf: url)

            input = contents
        }
    }
}