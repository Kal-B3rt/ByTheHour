//
//  lineshape.swift
//  ByTheHour
//
//  Created by Kenny Albert on 4/3/23.
//

import Foundation
import SwiftUI

struct NewLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
        
    
}
