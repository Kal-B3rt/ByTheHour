//
//  Project-CoreDataHelpers.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//

import Foundation


extension Project{
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
        let itemsArray = items?.allObjects as? [Item] ?? []
        
        
        return itemsArray.sorted { first, second in
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
    
    
}