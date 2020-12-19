//
//  CampusData.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import Foundation
import SwiftUI
import Firebase

/* adding test values for this stuff
var b1 = Building(name: "W.E.B. DuBois Library", address: "52 Hicks Way", capacity: 300, population: 40, crowd: 13, accent: 0)
var b2 = Building(name: "Integrative Learning Center", address: "110 North Pleasant St", capacity: 200, population: 100, crowd: 50, accent: 2)*/
var buildings: [Building] = load()

func load() -> [Building] {
    
    // creating reference that points to root of database
    var ref: DatabaseReference!
    ref = Database.database().reference()
    
    
    // building array
    var blds: [Building] = []
    
    var b2 = Building(name: "Integrative Learning Center", address: "110 North Pleasant St", capacity: 200, population: 100, crowd: 50, accent: 2)
    blds.append(b2)
    
    // loop through all children
    for j in 0...9 {
        /* save the JSON values to the NSDictionary
        ref.child("\(j)").child("Name").observeSingleEvent(of: .childAdded, with: { (data) in
            let name : String = (data.)
        })
        */
        var na : String = ""

        ref.child("\(j)").observe(.value, with: { (snapshot) in
            let id = snapshot.value as? NSDictionary
            var ad : String = ""
            var cap : Int = 0
            var pop : Int = 0
            
            if id?.value(forKey: "Name") != nil {
                na = (id?.value(forKey: "Name") as? String)!
            }
            if id?.value(forKey: "Address") != nil {
                ad = (id?.value(forKey: "Address") as? String)!
            }
            if id?.value(forKey: "Capacity") != nil {
                cap = (id?.value(forKey: "Capacity") as? Int)!
            }
            if id?.value(forKey: "Population") != nil {
                pop = (id?.value(forKey: "Population") as? Int)!
            }
            
            let crd = Int(Double(pop) / Double(cap) * 100)
            var acc = 0
            
            if crd >= 60 {
                acc = 2
            } else if crd >= 30 {
                acc = 1
            }
            
            b2 = Building(name: na, address: ad, capacity: cap, population: pop, crowd: crd, accent: acc)
            blds.append(b2)
            
            buildings = blds

            print(na, cap, pop, crd, acc)
            
        })
        
    }
    
    return blds
    

}
