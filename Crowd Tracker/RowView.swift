//
//  RowView.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            HStack {
                
                Spacer()
                    .frame(width: 13)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(red: 0.91, green: 0.13, blue: 0.13))
                    .frame(width: 5, height: 46, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Integrative Learning Center")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(red: 0.18, green: 0.31, blue: 0.44, opacity: 1.0))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text("650 N Pleasant St")
                        .font(.subheadline)
                        .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.76))
                }
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.91, green: 0.13, blue: 0.13)) // red
                        .frame(width: 65, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("21%")
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
        RowView()
    }
}
