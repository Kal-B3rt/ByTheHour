//
//  TestView.swift
//  ByTheHour
//
//  Created by Kenny Albert on 4/3/23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack{
                MultiplyShape1()
                    .stroke(lineWidth: 5)
                MultiplyShape2()
                    .stroke(lineWidth: 5)
            }
            .frame(width: 100, height: 100)
            Spacer()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
