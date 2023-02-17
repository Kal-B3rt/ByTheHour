//
//  HomeView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//
import CoreData
import SwiftUI

struct HomeView: View {
    static let tag: String? = "Home"
    @EnvironmentObject var dataController: DataController
    
    ///This  fetch request fetches all of the projects that are still open and puts them in Sorting order by alphabetical.
    @FetchRequest(entity: Project.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Project.title, ascending: true)], predicate: NSPredicate(format: "closed = false")) var projects: FetchedResults<Project>
    
    let items: FetchRequest<Item>
    
    init() {
        
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
            }
            .background(Color.systemGroupedBackground.ignoresSafeArea())
            .navigationTitle("Home")
        }
    }
}

/*
 Button("Add Data") {
     dataController.deleteAll()
     try? dataController.createSampleData()
 }
 */

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
