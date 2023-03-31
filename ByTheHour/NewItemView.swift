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
    @State private var rate = ""
    @State private var title = "New Item"
    @State private var total = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Item Name", text: $title)
                    
                }
                
                Section(header: Text("Details")) {
                    TextField("Time", text: $time)
                    TextField("Rate", text: $rate)
                    TextField("Total", text: $total)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
            }
            Section(header: Text("Total")){
                
            }
            .navigationTitle("\(title)")
            
        }
    }
}
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView()
        }
    }
