//
//  ContentView.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import SwiftUI

final class buildingArray: ObservableObject {
    var array : [Building] = buildings
    
    func updateArray() -> Void {
        array = load()
    }
}

struct ContentView: View {
    @State var bArray: [Building] = load()
    @ObservedObject var BA: buildingArray = buildingArray()
    @State private var toggleStatus:Bool = false
    
    var body: some View {
        ZStack {
            
            // Background Color
            
            Color(red: 0.89, green: 0.91, blue: 0.95)
                .ignoresSafeArea()

            
            VStack {
                
                // Horizontal Stack with the Logo and App Name
                
                HStack {
                    
                    Image("logo").resizable()
                        .frame(width: 78, height: 78, alignment: .center)
                    
                    Text("UDistance")
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundColor(Color(red: 0.18, green: 0.31, blue: 0.44, opacity: 1.0))
                }
                
                // Scroll View making a RowView for each building in Buildings
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(BA.array, id: \.self) { building in
                            RowView(building: building)
                                .mask(RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 380, height: 65, alignment: .center))
                                .shadow(color: Color(red: 0.29, green: 0.34, blue: 0.44, opacity: 0.10), radius: 10, x: 0, y: 10)
                            
                        }
                        
                    }
                }
            }
            
            // Adding the bottom location-safety bar
            VStack {
                
                Spacer()
                
                HStack {
                    Button(action: {BA.updateArray()}, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                    LocationView()
                        .shadow(color: Color(red: 0.29, green: 0.34, blue: 0.44, opacity: 0.2), radius: 30, x: 0, y: 10)
                    Button(action: {
                                self.toggleStatus = !self.toggleStatus
                            }) {
                                Text((toggleStatus == false) ? "Press Me" : "Unpress me")
                            }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
