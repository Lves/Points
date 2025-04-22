//
//  ContentView.swift
//  Points
//
//  Created by xingle on 2025/4/10.
//
/*
 1. 本地化
 2. 通用化
 3. 设置
 4. 存储
 5. Icon
 */

import SwiftUI

struct ContentView: View {
    @StateObject private var game = TennisGame(maxGamesPerSet: 6, maxSetsToWin: 2)
    @StateObject private var timerViewModel = TimerViewModel()
    @State private var number = 1
    @State private var gme = 1
    
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
                    ZStack {
                        VStack(spacing: 0) {
                            RadialGradientView(color: .redDarkXL, center: view1Center, size: halfSize) {
                                Text("\(game.displayPoint(for: 0))")
                                    .font(.monospacedDigit(.system(size: 250))())
                                    .foregroundColor(.redXL)
                            }.onTapGesture(perform: leftTapped)
                            RadialGradientView(color: .blueDark, center: view2Center, size: halfSize) {
                                Text("\(game.displayPoint(for: 1))")
                                    .font(.monospacedDigit(.system(size: 250))())
                                    .foregroundColor(.blue)
                            }.onTapGesture(perform: rightTapped)
                        }
                        
                        TimerView(viewModel: timerViewModel)
                        
                        HStack {
                            Spacer()
                            
                            HStack {
                                if game.sets.0 > 0 || game.sets.1 > 0 {
                                    VStack{
                                        Text("\(game.sets.0)")
                                        Text("\(game.sets.1)")
                                    }
                                    .foregroundColor(.white.opacity(0.5))
                                }
                                
                                VStack{
                                    Text("\(game.games.0)")
                                    Text("\(game.games.1)")
                                }
                                .foregroundColor(.white)
                            }
                            .frame(height: 80)
                            .frame(minWidth: 60)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12, corners: [.topLeft, .bottomLeft]) // 自定义圆角
                            .font(.title)
                            
                            .font(.system(size: 16, weight: .bold))
                        }
                        
                        VStack {
                            Spacer()
                            NumberView(number: $number)
                        }
                        
                        RevertButton {
                            game.undo()
                        }
                    }
                } else {
                    ZStack {
                        HStack(spacing: 0) {
                            LinearGradientView(color: .redDarkXL, size: halfSize, isLeft: true) {
                                Text("\(game.displayPoint(for: 0))")
                                    .font(.monospacedDigit(.system(size: 200))())
                                    .foregroundColor(.redXL)
                            }.onTapGesture(perform: leftTapped)
                            
                            LinearGradientView(color: .blueDarkXL, size: halfSize, isLeft: false) {
                                Text("\(game.displayPoint(for: 1))")
                                    .font(.monospacedDigit(.system(size: 200))())
                                    .foregroundColor(.blueXL)
                            }.onTapGesture(perform: rightTapped)
                        }
                        
                        TimerView(viewModel: timerViewModel)
                        
                        VStack {
                           
                            VStack {
                                if game.sets.0 > 0 || game.sets.1 > 0 {
                                    HStack{
                                        Text("\(game.sets.0)")
                                            .font(.title)
                                        Text(" : ")
                                            .font(.title)
                                        Text("\(game.sets.1)")
                                            .font(.title)
                                    }
                                    .foregroundColor(.white.opacity(0.5))
                                }
                                
                                HStack {
                                    Text("\(game.games.0)")
                                        .font(.title)
                                    Image(systemName: "figure.tennis")
                                    Text("\(game.games.1)")
                                        .font(.title)
                                }
                                .foregroundColor(.white)

                            }
                            .padding(.horizontal)
                            .frame(minHeight: 60)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                            .font(.system(size: 16, weight: .bold))
                                                        
                            
                            Spacer()
                            NumberView(number: $number)
                        }
                        
                        RevertButton {
                            game.undo()
                        }
                    }
                }
            }
        }
        .background(Color.darkXL)
        .ignoresSafeArea()
    }
    
    //MARK: - Action
    
    func leftTapped() {
        shake()
        game.scorePoint(for: 0)
    }
    
    func rightTapped() {
        shake()
        game.scorePoint(for: 1)
    }
}

#Preview {
    ContentView()
}
