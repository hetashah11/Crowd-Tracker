//
//  Building.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import Foundation
import SwiftUI

/*
    Building data-type:
        * Each RowView uses data from a single Building structure
        * Contains Row Values of each data entry from Firebase
 */

struct Building: Hashable, Codable {
    
    var name: String
    var address: String
    var capacity: Int // capacity of the building
    var population: Int // current number of people in the building
    var crowd: Int // percentage crowded; crowd = population/capacity * 100%
    
    var accent: Int
    
}
