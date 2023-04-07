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
    @State private var rate = 10.25
    @State private var title = "New Item"
    @State private var total = ""
    @State private var date = Date()
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0){
                Text("0:00")
                    .font(Font.system(size:100))
                
                
                HStack(alignment: .bottom){
                    ZStack(alignment: .bottomLeading){
                        MultiplyShape1()
                            .stroke(lineWidth: 2)
                        MultiplyShape2()
                            .stroke(lineWidth: 2)
                    }
                    .frame(width: 25, height: 30)
                    .padding(.bottom)
                    .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    
                    
                    Text("$\(rate, specifier: "%.2f")")
                        .font(Font.system(size:70))
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            showingSheet = true
                        }
                }
                NewLine()
                    .stroke(lineWidth: 2)
                    .padding(0)
                    .foregroundColor(.secondary)
                
            }
            .frame(width: 300, height: 250)
            .padding(.horizontal)
            
            Spacer()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(rate: $rate)
            
        }
    }
}
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView()
        }
    }

