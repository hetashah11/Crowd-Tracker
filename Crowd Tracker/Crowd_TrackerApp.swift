//
//  Crowd_TrackerApp.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

/*
 
    The Main File for the App
 
 */

import SwiftUI
import RadarSDK
import Firebase

@main
struct Crowd_TrackerApp: App {
    
    init() {
        // occurs during application load
        FirebaseApp.configure()
        load()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
