//
//  SheetView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 4/6/23.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var rate: Double

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    rate += 1
                } label: {
                    Image(systemName: "arrow.up")
                        .fontWeight(.heavy)
                }
                Spacer()
                Button {
                    rate += 0.25
                } label: {
                    Image(systemName: "arrow.up")
                        .fontWeight(.heavy)
                }
                Spacer()


            }
            Text("$\(rate, specifier: "%.2f")")
                .font(Font.system(size:70))
                .fontWeight(.light)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
        }
    }
}
