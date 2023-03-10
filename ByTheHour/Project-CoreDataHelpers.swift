//
//  Project-CoreDataHelpers.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//

import Foundation


extension Project{
    
    static let colors = ["Pink", "Purple", "Red", "Orange", "Gold", "Green", "Teal", "Light Blue", "Dark Blue", "Midnight", "Dark Gray", "Gray"]
    var projectTitle: String {
        title ?? "New Project"
    }
    var projectCreationDate: Date {
        creationDate ?? Date()
    }
    
    var projectDetail: String {
        detail ?? ""
    }
    
    var projectColor: String {
        color ?? "Light Blue"
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is default detail text."
        project.creationDate = Date()
        project.closed = false
        
        return project
    }
    
    var projectItems: [Item] {
        items?.allObjects as? [Item] ?? []
    }
    
    
    var projectItemsDefaultSorted: [Item] {
        projectItems.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }
            
            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        let originalItems = items?.allObjects as? [Item] ?? []
        guard originalItems.isEmpty == false else { return 0}
        
        let completedItems = originalItems.filter(\.completed)
        
        return Double(completedItems.count) / Double(originalItems.count)
    }
    
    func projectItems
    (using sortOrder: Item.SortOrder) -> [Item] {
        switch sortOrder {
        case .title:
            return projectItems.sorted { $0.itemTitle < $1.itemTitle }
        case .creationDate:
            return projectItems.sorted { $0.itemCreationDate < $1.itemCreationDate }
        case .optimized:
            return projectItemsDefaultSorted
        }
    }
    
    
}
