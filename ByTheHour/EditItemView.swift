//
//  EditItemView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/8/23.
//

import SwiftUI

struct EditItemView: View {
    let item: Item
    
    @EnvironmentObject var dataController: DataController
    
    @State private var title: String
    @State private var detail: String
    @State private var time: Double
    @State private var pay: Double
    @State private var completed: Bool
    
    init(item: Item) {
        self.item = item
        
        _title = State(wrappedValue: item.itemTitle)
        _detail = State(wrappedValue: item.itemDetail)
        _time = State(wrappedValue: item.time)
        _pay = State(wrappedValue: item.pay)
        _completed = State(wrappedValue: item.completed)
        
        
    }
    var body: some View {
        Form {
            Section(header: Text("Basic settings")) {
                TextField("Item name", text: $title)
                TextField("Description", text: $detail)
            }
            
            Section(header: Text("Pay Settings")) {
                TextField("Pay", value: $pay, format: .number)
                TextField("time", value: $time, format: .number)
            }
            
            Section(header: Text("Form Status")) {
                Toggle("Submitted", isOn: $completed)
            }
        }
        .navigationTitle("Edit Item")
        .onDisappear(perform: update)
    }
    
    func update() {
        item.project?.objectWillChange.send()
        
        item.title = title
        item.detail = detail
        item.time = time
        item.pay = pay
        item.total = pay * time
        item.completed = completed
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(item: Item.example)
    }
}
