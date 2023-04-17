//
//  Timer-Additions.swift
//  ByTheHour
//
//  Created by Kenny Albert on 4/17/23.
//

import Foundation
import SwiftUI

extension TimeInterval {
    var formattedTime: String {
        let hours = Int(self) / 3600
        let minutes = (Int(self) / 60) % 60
        let seconds = Int(self) % 60
        
        if hours > 0 {
            return String(format: "%.1d:%.2d:%.2d", hours, minutes, seconds)
        } else {
            return String(format: "%.2d:%.2d", minutes, seconds)
        }
    }
}

