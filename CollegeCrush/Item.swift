//
//  Item.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
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
