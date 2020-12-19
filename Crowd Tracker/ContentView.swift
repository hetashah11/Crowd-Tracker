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
            
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    
                    RowView()
                        .mask(RoundedRectangle(cornerRadius: 10)
                            .frame(width: 380, height: 65, alignment: .center))
                    
                    // sample loop through data
                    ForEach(1...100, id: \.self) {
                        Text("Row \($0)")
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
