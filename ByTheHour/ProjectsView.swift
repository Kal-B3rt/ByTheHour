//
//  ProjectsView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/6/23.
//

import SwiftUI

struct ProjectsView: View {
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
            List {
                ForEach(projects.wrappedValue) { project in
                    Section(header: Text(project.projectTitle)) {
                        ForEach(project.projectItems) { item in
                            HStack{
                                Text(item.itemTitle)
                                Spacer()
                                Text("$\(String(format: "%.2f", item.total ))")
                                    .foregroundColor(Color.green)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showCompletedProjects ? "Closed Projects" : "Open Projects")
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
