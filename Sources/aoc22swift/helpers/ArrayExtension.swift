//
// Created by Kubilay Erdogan on 2022-12-05.
//

import Foundation

extension Array {
    mutating func transferFirstItem(to array: inout Array) {
        guard count > 0 else {
            return
        }
        let item = self.removeFirst()
        array.prepend(item)
    }

    mutating func prepend(_ item: Element) {
        insert(item, at: 0)
    }
}
