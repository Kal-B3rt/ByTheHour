//
//  NewItemView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 3/31/23.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var time = ""
    @State private var rate = 10.00
    @State private var title = "New Item"
    @State private var total = ""
    @State private var date = Date()
    
    var body: some View {
        VStack {
            
            Text("Per Hour Rate")
                .frame(alignment: .leading)
                .foregroundColor(.secondary)
                
            
            HStack(alignment: .center){
                VStack {
                    //buttons to change whole dollar amount
                    Button {
                        rate += 1
                    } label: {
                        Image(systemName: "arrow.up")
                    }
                    .frame(width: 90, height: 44)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    
                    Button {
                        if rate > 1 {
                            rate -= 1 }
                    } label: {
                        Image(systemName: "arrow.down")
                    }
                    .frame(width: 90, height: 44)
                    .background(Color.blue)
                    .foregroundColor(Color.red)
                    .cornerRadius(10)

                }
                Text("\(rate.formatted(.currency(code: "USD")))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                VStack {
                    //Buttons to change cents amount. Increments of .25
                    Button {
                        rate += 0.25
                    } label: {
                        Image(systemName: "arrow.up")
                            .fontWeight(.bold)
                    }
                    .frame(width: 90, height: 44)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    
                    Button {
                        if rate > 0 {
                            rate -= 0.25 }
                    } label: {
                        Image(systemName: "arrow.down")
                    }
                    .frame(width: 90, height: 44)
                    .background(Color.blue)
                    .foregroundColor(Color.red)
                    .cornerRadius(10)

                }
            }
        }
    }
}
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView()
        }
    }
