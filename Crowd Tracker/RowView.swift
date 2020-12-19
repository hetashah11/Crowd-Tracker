//
//  RowView.swift
//  Crowd Tracker
//
//  Created by Dhruv Vikram Krishna on 12/19/20.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.red)
                .frame(width: 5, height: 46, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Integrative Learning Center")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                Text("650 N Pleasant St")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 65, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text("21%")
                    .font(.headline)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
