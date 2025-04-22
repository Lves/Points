//
//  ContentView.swift
//  Points
//
//  Created by xingle on 2025/4/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var game = TennisGame(maxGamesPerSet: 6, maxSetsToWin: 2)
    @State private var number = 1
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
                            }.onTapGesture {
                                game.scorePoint(for: 0)
                            }
                            RadialGradientView(color: .blueDark, center: view2Center, size: halfSize) {
                                Text("\(game.displayPoint(for: 1))")
                                    .font(.monospacedDigit(.system(size: 250))())
                                    .foregroundColor(.blue)
                            }.onTapGesture {
                                game.scorePoint(for: 1)
                            }
                        }
                        
                        TimerView()
                        
                        HStack {
                            Spacer()
                            
                            VStack {
                                Text("\(game.games.0)")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("\(game.games.1)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.gray)
                        }
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    game.undo()
                                }) {
                                    Text("回撤")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.title)
                                        .padding()
                                }
                                .padding(.top, 40)
                                
                            }
                            Spacer()
                            
                            NumberView()
                        }
                    }
                } else {
                    ZStack {
                        HStack(spacing: 0) {
                            LinearGradientView(color: .redDarkXL, size: halfSize, isLeft: true) {
                                Text("\(game.displayPoint(for: 0))")
                                    .font(.monospacedDigit(.system(size: 200))())
                                    .foregroundColor(.redXL)
                            }.onTapGesture {
                                game.scorePoint(for: 0)
                            }
                            
                            LinearGradientView(color: .blueDarkXL, size: halfSize, isLeft: false) {
                                Text("\(game.displayPoint(for: 0))")
                                    .font(.monospacedDigit(.system(size: 200))())
                                    .foregroundColor(.blueXL)
                            }.onTapGesture {
                                game.scorePoint(for: 1)
                            }
                        }
                        TimerView()
                        
                        VStack {
                            HStack {
                                Text("\(game.games.0) : \(game.games.1)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.gray)
                            Spacer()
                            NumberView()
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
