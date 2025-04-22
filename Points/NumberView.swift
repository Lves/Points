//
//  NumberView.swift
//  Points
//
//  Created by xingle on 2025/4/16.
//

import Foundation
import SwiftUI

struct NumberView: View {
    @State var number = 0

    var body: some View {
        Button(action: {
            number += 1
        }) {
            Text("\(number*100)")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .frame(width: 160)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
        }
        .padding()
    }
   
}
