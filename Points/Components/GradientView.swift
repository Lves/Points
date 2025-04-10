//
//  GradientView.swift
//  Points
//
//  Created by xingle on 2025/4/10.
//

import SwiftUI

struct RadialGradientView<Content>: View  where Content : View {
    let color: Color
    let center: UnitPoint
    let size: CGSize
    let content: () -> Content
    
    init(color: Color, center: UnitPoint, size: CGSize, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.center = center
        self.size = size
        self.content = content
    }
    
    var body: some View {
        return ZStack {
            RadialGradient(
                gradient: Gradient(colors: [color,  .darkXL,  .darkXL]),
                center: center,
                startRadius: 0,
                endRadius: max(size.width, size.height)
            )
            .frame(width: size.width, height: size.height)
            content()
        }
    }
}

struct LinearGradientView<Content>: View  where Content : View {
    let color: Color
    let size: CGSize
    let isLeft: Bool
    let content: () -> Content
    
    init(color: Color, size: CGSize, isLeft: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.size = size
        self.isLeft = isLeft
        self.content = content
    }
    
    var body: some View {
        return ZStack {
            LinearGradient(
                gradient: Gradient(colors: [color, .darkXL, .darkXL]),
                startPoint: isLeft ? .leading : .trailing,
                endPoint: isLeft ? .trailing : .leading
            )
            .frame(width: size.width, height: size.height)
            content()
        }
    }
}
