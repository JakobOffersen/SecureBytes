//
//  File.swift
//  
//
//  Created by Jakob Offersen on 18/02/2021.
//

import Foundation

internal extension Range where Bound == Int {
    func offset(by offset: Int) -> Range<Int> {
        (offset + startIndex)..<(offset + endIndex)
    }

    func isSubrange(of other: Range<Int>) -> Bool {
        self.startIndex >= other.startIndex && self.endIndex <= other.endIndex
    }
}
