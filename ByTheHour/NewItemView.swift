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
        VStack{
            VStack{
                Text("0:00")
                HStack{
                    ZStack{
                        MultiplyShape1()
                            .stroke(lineWidth: 3)
                        MultiplyShape2()
                            .stroke(lineWidth: 3)
                    }
                    .frame(width: 10, height: 10)
                    Text("per hr")
                    Text(String(rate.formatted(.currency(code: "USD"))))
                }
                NewLine()
                    .stroke(lineWidth: 4)
                
            }
            .frame(width: 300, height: 100)
            .padding(30)
            .background(Color.secondary)
            .cornerRadius(10)
        }
        Spacer()
        Text("New Stuff")
    }
}
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView()
        }
    }
