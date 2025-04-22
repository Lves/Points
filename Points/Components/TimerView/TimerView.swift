//
//  TimerView.swift
//  Points
//
//  Created by xingle on 2025/4/16.
//

import Foundation
import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        Button(action: {
            if viewModel.isRunning {
                viewModel.pauseTimer()
            } else {
                viewModel.startTimer()
            }
        }) {
            Text(viewModel.isRunning ? "\(formattedTime)" : (viewModel.timeElapsed == 0 ? "Start" : "Continue"))
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .frame(width: 160)
                .background(viewModel.isRunning ? Color.red.opacity(0.2) : Color.green.opacity(0.2))
                .cornerRadius(12)
        }
        .padding()
    }

    var formattedTime: String {
        let minutes = viewModel.timeElapsed / 60
        let seconds = viewModel.timeElapsed % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
