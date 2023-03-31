//
//  ProjectSummaryView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 3/13/23.
//

import SwiftUI

struct ProjectSummaryView: View {
    @ObservedObject var project: Project
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(project.projectItems.count) items")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(project.projectTitle)
                .font(.title2)
            
            ProgressView(value: project.completionAmount)
                .accentColor(Color(project.projectColor))
        }
        .padding()
        .background(Color.secondarySystemGroupedBackground)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5)
    }
}

struct ProjectSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectSummaryView(project: Project.example)
    }
}
