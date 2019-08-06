//
//  napTimer.swift
//  TimerApp
//
//  Created by Blake kvarfordt on 8/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class NapTimer {
    
    //MARk: - Properties
    private var timer: Timer?
    var timeLeft: TimeInterval?
    var isOn: Bool {
        return timeLeft == nil ? false : true
    }
    
    // MARK: - Public Methods
    func startTimer(_ time: TimeInterval) {
        if isOn {
        print("timer is already running")
        } else {
            self.timeLeft = time
            self.timer = Timer(timeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        timeLeft = nil
        timer?.invalidate()
        print("stopped timer")
    }
    
    // MARK: - Private Methods
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else { return }
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(self.timeLeft as Any)
        } else {
            stopTimer()
        }
    }
    
    
    
    
}
