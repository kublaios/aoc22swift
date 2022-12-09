//
// Created by Kubilay Erdogan on 2022-12-09.
//

import Foundation

struct IdentifiableDigit: Hashable {
    let id: UUID = UUID()
    let digit: Int
}
