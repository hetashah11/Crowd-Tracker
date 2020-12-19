//
//  RowView.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import SwiftUI

struct RowView: View {
    
    var building: Building
    
    var body: some View {
        
        // Z Stack (for background)
        
        ZStack {
            
            // initializing accent colors: will be used based on the value of the building object of each particular row
            let redAccent = Color(red: 0.91, green: 0.13, blue: 0.13)
            let orangeAccent = Color(red: 0.93, green: 0.60, blue: 0.05)
            let greenAccent = Color(red: 0.05, green: 0.77, blue: 0.09)

            let accents: [Color] = [greenAccent, orangeAccent, redAccent]
            
            Color.white
                .ignoresSafeArea()
            
            HStack {
                
                // a bit of space before the indicator
                Spacer()
                    .frame(width: 13)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(accents[building.accent])
                    .frame(width: 5, height: 46, alignment: .leading)
                
                // text information from the building object
                VStack(alignment: .leading) {
                    Text(building.name)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(red: 0.18, green: 0.31, blue: 0.44, opacity: 1.0))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text(building.address)
                        .font(.subheadline)
                        .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.76))
                }
                
                Spacer()
                
                // a z stack for the percentage
                
                ZStack {
                    Rectangle()
                        .fill(accents[building.accent]) // red
                        .frame(width: 65, height: 65, alignment: .center)
                    
                    Text(String(building.crowd) + "%")
                        .font(.headline)
                        .foregroundColor(Color.white)
                }
                
            }
            .padding()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(building: buildings[0])
    }
}
