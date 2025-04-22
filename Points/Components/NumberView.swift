//
//  NumberView.swift
//  Points
//
//  Created by xingle on 2025/4/16.
//

import Foundation
import SwiftUI

struct NumberView: View {
    @Binding var number: Int

    var body: some View {
        Button(action: {
            number += 1
        }) {
            Text("\(number*100)")
                .foregroundColor(.white)
                .font(.body)
                .fixedSize()
                .padding()
                .frame(width: 130)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(12)
        }
        .padding()
    }
   
}

#Preview {
    RadialGradientView(color: .blueDark, center: UnitPoint(x: 0.5, y: 0.0), size: CGSize(width: 700, height: 700)) {
        NumberView(number: Binding.constant(1))
    }
}
