//
//  TimerView.swift
//  Points
//
//  Created by xingle on 2025/4/16.
//

import Foundation
import SwiftUI

struct TimerView: View {
    @State private var isRunning = false
    @State private var timeElapsed: Int = 0
    @State private var timer: Timer? = nil

    var body: some View {
        Button(action: {
            if isRunning {
                pauseTimer()
            } else {
                startTimer()
            }
        }) {
            Text(isRunning ? "\(formattedTime)" : (timeElapsed == 0 ? "Start" : "Continue"))
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .frame(width: 160)
                .background(isRunning ? Color.red.opacity(0.2) : Color.green.opacity(0.2))
                .cornerRadius(12)
        }
        .padding()
        .onDisappear {
            timer?.invalidate()
        }
    }

    var formattedTime: String {
        let minutes = timeElapsed / 60
        let seconds = timeElapsed % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeElapsed += 1
        }
    }

    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }
}
