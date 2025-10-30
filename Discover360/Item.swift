//
//  Item.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
