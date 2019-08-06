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
    
    func presentAlert() {
        let alertController = UIAlertController(title: "Time's up", message: "Do you wnat to keep sleeping?", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = "How many more seconds of sleep?"
        }
        
        let dismissAction = UIAlertAction(title: "I'm Awake", style: .destructive, handler: nil)
        let snoozAction = UIAlertAction(title: "Snooze", style: .cancel) { (_) in
        if let textField = alertController.textFields?.first,
            let inputText = textField.text,
            let textAsDouble = Double(inputText) {
            self.napTimer.startTimer(textAsDouble)
            }
        }
        alertController.addAction(snoozAction)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func timerButtonTapped(_ sender: UIButton) {
        if napTimer.isOn {
            napTimer.stopTimer()
            napTimer.startTimer(5)
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
        presentAlert()
    }
    
    
}
