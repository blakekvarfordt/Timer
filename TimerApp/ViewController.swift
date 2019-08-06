//
//  ViewController.swift
//  TimerApp
//
//  Created by Blake kvarfordt on 8/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    // MARK: - Properties
    
    var napTimer = NapTimer()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        napTimer.startTimer(20)
        napTimer.delegate = self
    }

    // MARK: - Custom Methods
    func updateLabelAndButton() {
        timerLabel.text = napTimer.timeLeftAsString()
        
        var buttonTitle = "Stop"
        var buttonColor: UIColor
        
        if napTimer.isOn {
            buttonTitle = "Stop"
            buttonColor = .red
        } else {
            buttonColor = .white
            buttonTitle = "Start"
        }
        
        timerButton.setTitle(buttonTitle, for: .normal)
        timerButton.setTitleColor(buttonColor, for: .normal)
    }
    
    
    // MARK: - Actions
    @IBAction func timerButtonTapped(_ sender: UIButton) {
        if napTimer.isOn {
            napTimer.stopTimer()
        } else {
            napTimer.startTimer(8)
        }
    }
    
}

extension ViewController: NapTimerDelegate {
    func timerSecondTicked() {
        updateLabelAndButton()
    }
    
    func timerStopped() {
        updateLabelAndButton()
    }
    
    func timerCompleted() {
        
    }
    
    
}
