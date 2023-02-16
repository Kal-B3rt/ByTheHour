//
//  ProjectsView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//

import SwiftUI

struct ProjectsView: View {
    static let openTag: String? = "open"
    static let closedTag: String? = "closed"
    
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var showingSortOrder = false
    
    @State private var sortOrder = Item.SortOrder.optimized
    
    let showCompletedProjects: Bool
    
    let projects: FetchRequest<Project>
    
    init(showCompletedProjects: Bool) {
        self.showCompletedProjects  = showCompletedProjects

        projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)
        ], predicate: NSPredicate(format: "closed = %d", showCompletedProjects))
    }
    
    var body: some View {
        NavigationView {
            Group {
                if projects.wrappedValue.isEmpty {
                    Text("There's nothing here right now.")
                        .foregroundColor(.secondary)
                } else {
                    List {
                        ForEach(projects.wrappedValue) { project in
                            Section(header: ProjectHeaderView(project: project)) {
                                ForEach(project.projectItems(using: sortOrder)) { item in
                                    ItemRowView(project: project, item: item)
                                }
                                .onDelete { offsets in
                                    let sortedItems = project.projectItems(using: sortOrder)
                                    
                                    for offset in offsets {
                                        let item = sortedItems[offset]
                                        dataController.delete(item)
                                    }
                                    dataController.save()
                                }
                                
                                if showCompletedProjects == false {
                                    Button {
                                        withAnimation {
                                            let item = Item(context: managedObjectContext)
                                            item.project = project
                                            item.creationDate = Date()
                                            dataController.save()
                                        }
                                    } label: {
                                        Label("Add New Item", systemImage: "plus")
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle(showCompletedProjects ? "Closed Projects" : "Open Projects")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing){
                    if showCompletedProjects == false {
                        Button {
                            withAnimation {
                                let project = Project(context: managedObjectContext)
                                project.closed = false
                                project.creationDate = Date()
                                dataController.save()
                            }
                        } label: {
                            Label("Add Project", systemImage: "plus")
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingSortOrder.toggle()
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }

                }
            }
            .confirmationDialog("Sort Items", isPresented: $showingSortOrder) {
                Button("Optimized") {
                    sortOrder = .optimized
                }
                Button("Creation Date") {
                    sortOrder = .creationDate
                }
                Button("Title") {
                    sortOrder = .title
                }
            }
            
            SelectSomethingView()
        }
    }
    
   
    
}

struct ProjectsView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ProjectsView(showCompletedProjects: false)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .environmentObject(dataController)
    }
}
