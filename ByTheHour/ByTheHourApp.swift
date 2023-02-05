//
//  ByTheHourApp.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/4/23.
//

import SwiftUI

@main
struct ByTheHourApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
