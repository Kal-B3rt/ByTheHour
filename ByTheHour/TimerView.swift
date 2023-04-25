//
//  TimerView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 4/10/23.
//

import SwiftUI

struct TimerView: View {
    //
    @Binding var time: String
    @State private var secondsElapsed: TimeInterval = 0
    @Binding var isTimerRunning: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(secondsElapsed.formattedTime)")
                .font(.largeTitle)
            
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                secondsElapsed += 1
                time = secondsElapsed.formattedTime
            }
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text(TimeInterval(61).formattedTime) // Should display "00:01:01"
            Text(TimeInterval(3661).formattedTime) // Should display "1:01:01"
        }
    }
}

