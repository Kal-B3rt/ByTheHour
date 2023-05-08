//
//  ContentView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedView") var selectedView: String?
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            NewItemView()
                .tag(NewItemView.tag)
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Start New Time")
                }
            
            ProjectsView(showCompletedProjects: true)
                .tag(ProjectsView.closedTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Completed")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .environmentObject(dataController)
    }
}
