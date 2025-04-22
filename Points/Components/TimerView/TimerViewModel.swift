//
//  TimerViewModel.swift
//  Points
//
//  Created by xingle on 2025/4/22.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var isRunning: Bool = false
    @Published var timeElapsed: Int = 0

    private var timer: Timer?

    func startTimer() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                self.timeElapsed += 1
            }
        }
    }

    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }

    func resetTimer() {
        timer?.invalidate()
        timeElapsed = 0
        isRunning = false
    }

    deinit {
        timer?.invalidate()
    }
}

