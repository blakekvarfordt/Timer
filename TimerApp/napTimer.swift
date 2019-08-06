//
//  napTimer.swift
//  TimerApp
//
//  Created by Blake kvarfordt on 8/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

protocol NapTimerDelegate: class {
    func timerSecondTicked()
    func timerStopped()
    func timerCompleted()
}

class NapTimer {
    
    //MARk: - Properties
    private var timer: Timer?
    var timeLeft: TimeInterval?
    weak var delegate: NapTimerDelegate?
    var isOn: Bool {
        return timeLeft == nil ? false : true
    }
    
    // MARK: - Public Methods
    func startTimer(_ time: TimeInterval) {
        if isOn {
        print("timer is already running")
        } else {
            self.timeLeft = time
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        timeLeft = nil
        timer?.invalidate()
        print("stopped timer")
        delegate?.timerStopped()
    }
    
    func timeLeftAsString() -> String {
        let timeRemaining = Int(timeLeft ?? 3 * 60)
        let minutesRemaining = timeRemaining / 60
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        return String(format: "%02d : %02d", [minutesRemaining, secondsRemaining])
    }
    
    // MARK: - Private Methods
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else { return }
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(self.timeLeftAsString())
            delegate?.timerSecondTicked()
        } else {
            stopTimer()
            delegate?.timerCompleted()
        }
    }
    

    
    
}
