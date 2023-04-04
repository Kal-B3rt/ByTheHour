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
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .trailing, spacing: 0){
                Text("0:00")
                    .font(Font.system(size:100, design: .monospaced))
                    

                HStack(alignment: .bottom){
                    ZStack(alignment: .bottomLeading){
                        MultiplyShape1()
                            .stroke(lineWidth: 3)
                        MultiplyShape2()
                            .stroke(lineWidth: 3)
                    }
                    .frame(width: 15, height: 15)
                    .padding(.bottom)
                    
                    Spacer()
                    
                    Text("$\(String(rate))")
                        .font(Font.system(size:70, design: .monospaced))
                }
                NewLine()
                    .stroke(lineWidth: 4)
                    .padding(0)
                
            }
            .frame(width: 300, height: 250)
            .padding(.horizontal)
            
            
            Spacer()
            Text("New Stuff")
        }
    }
}
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView()
        }
    }
