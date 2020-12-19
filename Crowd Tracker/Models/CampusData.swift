//
//  CampusData.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import Foundation
import SwiftUI
import Firebase

// adding test values for this stuff
var b1 = Building(name: "W.E.B. DuBois Library", address: "52 Hicks Way", capacity: 300, population: 40, crowd: 13, accent: 0)
var b2 = Building(name: "Integrative Learning Center", address: "110 North Pleasant St", capacity: 200, population: 100, crowd: 50, accent: 2)
var buildings: [Building] = [b1, b2]

func load() -> Void {
    
    // creating reference that points to root of database
    var ref: DatabaseReference!
    ref = Database.database().reference()
    
    // save the JSON values to the NSDictionary
    ref.observeSingleEvent(of: .value, with: { (snapshot) in
        let id = snapshot.value as? NSDictionary
        
        // print to test
        print(String(describing: id))
    })
    
}
