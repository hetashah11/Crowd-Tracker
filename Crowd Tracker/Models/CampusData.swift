//
//  CampusData.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import Foundation
import SwiftUI
import Firebase

// adding an empty Building struct for storage
var b = Building(name: "Integrative Learning Center", address: "110 North Pleasant St", capacity: 200, population: 100, crowd: 50, accent: 2)

// the main array that stores updated building information
var buildings: [Building] = load()

func load() -> [Building] {
    
    // creating reference that points to root of database
    var ref: DatabaseReference!
    ref = Database.database().reference()
    
    // building array
    var blds: [Building] = []
    
    var id = NSDictionary()
    
    // using dispatch groups to prevent async issues
    let group1 = DispatchGroup()
    group1.enter()
    let group2 = DispatchGroup()
    group2.enter()
    let group3 = DispatchGroup()
    group3.enter()
        
    // find each building element
    
    ref.child("Berkshire DC").observe(DataEventType.value, with: { (snapshot) in
        
        // information for the building saved to this NSDict
        id = snapshot.value as? NSDictionary ?? NSDictionary()
        
        // creating variables to store dict values
        let na : String = "Berkshire DC"
        var ad : String = ""
        var cap : Int = 0
        var pop : Int = 0
        var crd : Int = 0

        // parsing dict for building values
        if id.value(forKey: "Address") != nil {
            ad = (id.value(forKey: "Address") as? String)!
        }
        if id.value(forKey: "Capacity") != nil {
            cap = (id.value(forKey: "Capacity") as? Int)!
        }
        if id.value(forKey: "Population") != nil {
            pop = (id.value(forKey: "Population") as? Int)!
        }

        // calculating crowd value as a percentage
        if id.value(forKey: "Capacity") != nil && id.value(forKey: "Population") != nil {
            crd = Int(Double(pop) / Double(cap) * 100)
        }

        // calculating accent based on the
        var acc = 0

        if crd >= 60 {
            acc = 2
        } else if crd >= 30 {
            acc = 1
        }

        // adding to Buildings array
        b = Building(name: na, address: ad, capacity: cap, population: pop, crowd: crd, accent: acc)
        blds.append(b)
        
        group1.leave()
        
     })
    
    ref.child("ILC").observe(DataEventType.value, with: { (snapshot) in
        // information for the building saved to this NSDict
        id = snapshot.value as? NSDictionary ?? NSDictionary()
        
        // creating variables to store dict values
        let na : String = "ILC"
        var ad : String = ""
        var cap : Int = 0
        var pop : Int = 0
        var crd : Int = 0

        // parsing dict for building values
        if id.value(forKey: "Address") != nil {
            ad = (id.value(forKey: "Address") as? String)!
        }
        if id.value(forKey: "Capacity") != nil {
            cap = (id.value(forKey: "Capacity") as? Int)!
        }
        if id.value(forKey: "Population") != nil {
            pop = (id.value(forKey: "Population") as? Int)!
        }

        // calculating crowd value as a percentage
        if id.value(forKey: "Capacity") != nil && id.value(forKey: "Population") != nil {
            crd = Int(Double(pop) / Double(cap) * 100)
        }

        // calculating accent based on the
        var acc = 0

        if crd >= 60 {
            acc = 2
        } else if crd >= 30 {
            acc = 1
        }

        // adding to Buildings array
        b = Building(name: na, address: ad, capacity: cap, population: pop, crowd: crd, accent: acc)
        blds.append(b)
        
        group2.leave()
     })
    
    ref.child("CICS").observe(DataEventType.value, with: { (snapshot) in
        // information for the building saved to this NSDict
        id = snapshot.value as? NSDictionary ?? NSDictionary()
        
        // creating variables to store dict values
        let na : String = "CICS"
        var ad : String = ""
        var cap : Int = 0
        var pop : Int = 0
        var crd : Int = 0

        // parsing dict for building values
        if id.value(forKey: "Address") != nil {
            ad = (id.value(forKey: "Address") as? String)!
        }
        if id.value(forKey: "Capacity") != nil {
            cap = (id.value(forKey: "Capacity") as? Int)!
        }
        if id.value(forKey: "Population") != nil {
            pop = (id.value(forKey: "Population") as? Int)!
        }

        // calculating crowd value as a percentage
        if id.value(forKey: "Capacity") != nil && id.value(forKey: "Population") != nil {
            crd = Int(Double(pop) / Double(cap) * 100)
        }

        // calculating accent based on the
        var acc = 0

        if crd >= 60 {
            acc = 2
        } else if crd >= 30 {
            acc = 1
        }

        // adding to Buildings array
        b = Building(name: na, address: ad, capacity: cap, population: pop, crowd: crd, accent: acc)
        blds.append(b)
        
        group3.leave()
        
     })
    
    // once the groups exit, the buildings array is updated
    
    group1.notify(queue: .main) {
        buildings = blds
    }
    
    group2.notify(queue: .main) {
        buildings = blds
    }
    
    group3.notify(queue: .main) {
        buildings = blds
    }
    
    /*
        this return in fact does nothing, but assigning the output to buildings array
        ensures that this function runs everytime during startup
    */
    
    return blds
}



/*
let id = snapshot.value as? NSDictionary
var na : String = ""
var ad : String = ""
var cap : Int = 0
var pop : Int = 0
var crd : Int = 0

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

if id?.value(forKey: "Capacity") != nil && id?.value(forKey: "Population") != nil {
    crd = Int(Double(pop) / Double(cap) * 100)
}

var acc = 0

if crd >= 60 {
    acc = 2
} else if crd >= 30 {
    acc = 1
}

b2 = Building(name: na, address: ad, capacity: cap, population: pop, crowd: crd, accent: acc)
blds.append(b2)

buildings = blds

// print(na, cap, pop, crd, acc)*/

