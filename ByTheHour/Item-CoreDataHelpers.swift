//
//  Item-CoreDataHelpers.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//

import Foundation

extension Item{
    
    enum SortOrder {
        case optimized, title, creationDate
    }
    
    var itemTitle: String {
        title ?? "New Item"
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }
    
    var itemDetail: String {
        detail ?? "Details..."
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
