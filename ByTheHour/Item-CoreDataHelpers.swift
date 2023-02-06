//
//  Item-CoreDataHelpers.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//

import Foundation

extension Item{
    var itemTitle: String {
        title ?? ""
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }
    
    var itemDetail: String {
        detail ?? ""
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an default example text."
        item.time = 6.5
        item.pay = 17.50
        item.total = item.time * item.pay
        item.creationDate = Date()
        
        return item
    }
    
    
    
}
