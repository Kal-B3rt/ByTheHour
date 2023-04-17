//
//  MoneyView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 4/17/23.
//

import SwiftUI

struct MoneyView: View {
    @Binding var time: String
    @Binding var rate: Double
    
    private var hours: Int {
        return Int(time) ?? 0
    }
    
    private var minutes: Int {
        let parts = time.split(separator: ":")
        return Int(parts.last ?? "0") ?? 0
    }
    
    private var totalMinutes: Int {
        return hours * 60 + minutes
    }
    
    private var money: Double {
        return Double(totalMinutes) / 60.0 * rate
    }
    
    var body: some View {
        let earned = String(format: "%.2f", money)
        return VStack {
            Text("Earned:")
                .font(.title)
                .foregroundColor(.secondary)
            Text("$\(earned)")
                .font(.system(size: 50))
                .fontWeight(.light)
        }
        .padding(.bottom)
    }
}


struct MoneyView_Previews: PreviewProvider {
    @State static var rate: Double = 11.25
    @State static var time = "10:10:00"
    
    static var previews: some View {
        MoneyView(time: $time, rate: $rate)
    }
}

