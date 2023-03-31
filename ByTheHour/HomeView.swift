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
    
    var projectRows: [GridItem] {
        [GridItem(.fixed(100))]
    }
    
    init() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "completed = false")
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.title, ascending: false)]
        
        request.fetchLimit = 10
        items = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: projectRows){
                            ForEach(projects, content: ProjectSummaryView.init)
                        }
                        .padding([.horizontal, .top])
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    VStack(alignment: .leading) {
                        ItemListView(title: "Up Next", items: items.wrappedValue.prefix(3))
                        ItemListView(title: "More to explore", items: items.wrappedValue.dropFirst(3 ))
                    }
                    .padding(.horizontal)
                }
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
