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
                        .frame(width: 44, height: 44)
                        .fontWeight(.heavy)
                        .foregroundColor(.green)
                }
                Spacer()
                Button {
                    rate += 0.25
                } label: {
                    Image(systemName: "arrow.up")
                        .frame(width: 44, height: 44)
                        .fontWeight(.heavy)
                        .foregroundColor(.green)
                }
                Spacer()


            }
            Text("$\(rate, specifier: "%.2f")")
                .font(Font.system(size:70))
                .fontWeight(.light)
                .foregroundColor(.secondary)
            
            HStack{
                Spacer()
                Button {
                    if rate >= 1.00 {
                        rate -= 1
                    }
                } label: {
                    Image(systemName: "arrow.down")
                        .frame(width: 44, height: 44)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                }
                Spacer()
                Button {
                    if rate != 0.00 {
                        rate -= 0.25
                    }
                } label: {
                    Image(systemName: "arrow.down")
                        .frame(width: 44, height: 44)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                }
                Spacer()
            }
            
            Spacer()
            
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
        }
    }
}
