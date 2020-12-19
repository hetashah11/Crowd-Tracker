//
//  CampusData.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import Foundation
import SwiftUI
import Firebase

var b1 = Building(name: "W.E.B. DuBois Library", address: "52 Hicks Way", capacity: 300, population: 40, crowd: 13, accent: 0)
var b2 = Building(name: "Integrative Learning Center", address: "110 North Pleasant St", capacity: 200, population: 100, crowd: 50, accent: 2)
var buildings: [Building] = [b1, b2]

func load() -> Void {
    var ref: DatabaseReference!

    ref = Database.database().reference()
    
    
    
}
