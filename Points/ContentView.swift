//
//  ContentView.swift
//  Points
//
//  Created by xingle on 2025/4/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            let isPortrait = size.height > size.width
            
            let view1Center = isPortrait
            ? UnitPoint(x: 0.5, y: 0.0)
            : UnitPoint(x: 0.0, y: 0.5)
            
            let view2Center = isPortrait
            ? UnitPoint(x: 0.5, y: 1.0)
            : UnitPoint(x: 1.0, y: 0.5)
            
            let halfSize = CGSize(width: size.width / (isPortrait ? 1 : 2),
                                  height: size.height / (isPortrait ? 2 : 1))
            
            Group {
                if UIScreen.isPortrait {
                    VStack(spacing: 0) {
                        RadialGradientView(color: .redDarkXL, center: view1Center, size: halfSize) {
                            Text("00")
                                .font(.monospacedDigit(.system(size: 200))())
                                .foregroundColor(.redXL)
                        }
                        
                        
                        RadialGradientView(color: .blueDark, center: view2Center, size: halfSize) {
                            Text("00")
                                .font(.monospacedDigit(.system(size: 200))())
                                .foregroundColor(.blue)
                        }
                    }
                } else {
                    HStack(spacing: 0) {
                        LinearGradientView(color: .redDarkXL, size: halfSize, isLeft: true) {
                            Text("00")
                                .font(.monospacedDigit(.system(size: 200))())
                                .foregroundColor(.redXL)
                        }
                        
                        LinearGradientView(color: .blueDarkXL, size: halfSize, isLeft: false) {
                            Text("00")
                                .font(.monospacedDigit(.system(size: 200))())
                                .foregroundColor(.blueXL)
                        }
                    }
                }
            }
        }
        .background(Color.darkXL)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
