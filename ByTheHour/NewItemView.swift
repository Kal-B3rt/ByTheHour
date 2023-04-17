//
//  NewItemView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 3/31/23.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
        
        @State private var time = "10:00" // changed from ""
        @State private var rate: Double = 10.25
        @State private var title = "New Item"
        @State private var total = ""
        @State private var date = Date()
    
    @State private var showingSheet = false
    
    @State private var isTimerRunning = false
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0){
                TimerView(isTimerRunning: $isTimerRunning)
                
                
                HStack(alignment: .bottom){
                    ZStack(alignment: .bottomLeading){
                        MultiplyShape1()
                            .stroke(lineWidth: 2)
                        MultiplyShape2()
                            .stroke(lineWidth: 2)
                    }
                    .frame(width: 25, height: 30)
                    .padding(.bottom)
                    .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    
                    
                    Text("$\(rate, specifier: "%.2f")")
                        .font(Font.system(size:70))
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            showingSheet = true
                        }
                }
                NewLine()
                    .stroke(lineWidth: 2)
                    .padding(0)
                    .foregroundColor(.secondary)
                
            }
            .frame(width: 300, height: 250)
            .padding(.horizontal)
            
            Spacer()
            
            MoneyView(time: $time, rate: $rate)
            
            
            
            Button(action: {
                            isTimerRunning.toggle()
                        }) {
                            Text(isTimerRunning ? "Stop" : "Start")
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isTimerRunning ? Color.red : Color.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        
            
            
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(rate: $rate)
            
        }
    }
}
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView()
        }
    }

