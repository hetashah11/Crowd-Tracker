//
//  ContentView.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.89, green: 0.91, blue: 0.95)
                .ignoresSafeArea()

            
            VStack {
                HStack {
                    
                    Image("logo").resizable()
                        .frame(width: 78, height: 78, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Crowd Tracker")
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundColor(Color(red: 0.18, green: 0.31, blue: 0.44, opacity: 1.0))
                }
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(buildings, id: \.self) { building in
                            RowView(building: building)
                                .mask(RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 380, height: 65, alignment: .center))
                                .shadow(color: Color(red: 0.29, green: 0.34, blue: 0.44, opacity: 0.10), radius: 10, x: 0, y: 10)
                            
                        }
                        
                    }
                }
            }
            
            VStack {
                Spacer()
                
                LocationView()
                    .shadow(color: Color(red: 0.29, green: 0.34, blue: 0.44, opacity: 0.2), radius: 30, x: 0, y: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
