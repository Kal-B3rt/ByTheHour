//
//  ItemRowView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/8/23.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var project: Project
    @ObservedObject var item: Item
    
    var icon: some View {
        if item.completed {
            return Image(systemName: "checkmark.circle")
                .foregroundColor(Color(project.projectColor))
        } else {
            return Image(systemName: "checkmark.circle")
                .foregroundColor(.clear)
        }
    }

    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)){
            HStack{
                Label {
                    Text(item.itemTitle)
                        .fontWeight(.semibold)
                } icon: {
                    icon
                }

                Spacer()
                Text("$\(String(format: "%.2f", item.total ))")
                    .foregroundColor(Color.green)
                    .fontWeight(.light)
            }
        }

    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(project: Project.example, item: Item.example)
    }
}
