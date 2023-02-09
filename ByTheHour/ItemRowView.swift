//
//  ItemRowView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 2/8/23.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item
    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)){
            HStack{
                Text(item.itemTitle)
                Spacer()
                Text("$\(String(format: "%.2f", item.total ))")
                    .foregroundColor(Color.green)
            }
        }

    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item.example)
    }
}
