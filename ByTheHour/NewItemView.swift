//
//  NewItemView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 3/31/23.
//

import SwiftUI
import Combine

struct NewItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var time = "00:00:00"
    @State private var rate: Double = 10.25
    @State private var title = "New Item"
    @State private var earned: Double = 0.0
    @State private var date = Date()
    
    @State private var showingSheet = false
    @State private var isTimerRunning = false
    

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0) {
                TimerView(time: $time, isTimerRunning: $isTimerRunning)
                
                HStack(alignment: .bottom) {
                    ZStack(alignment: .bottomLeading) {
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
            
            VStack {
                Text("Earned:")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text("$\(String(format: "%.2f", earned))")
                    .font(.system(size: 50))
                    .fontWeight(.light)
            }
            .padding()
            
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
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    if isTimerRunning {
                        calculateEarnedAmount(time: time, rate: rate)
                    }
                }
    }
    
    func calculateEarnedAmount(time: String, rate: Double) -> Void {
        let timeComponents = time.components(separatedBy: ":").compactMap { Double($0) }
        let seconds = timeComponents.count == 3 ? timeComponents[0] * 3600 + timeComponents[1] * 60 + timeComponents[2] : timeComponents[0] * 60 + timeComponents[1]
        let earned = seconds * rate / 3600
        self.earned = earned
        print(earned)
        return
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}

