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
    }

    
    
    // MARK: - Actions
    @IBAction func timerButtonTapped(_ sender: UIButton) {
    }
    
}

