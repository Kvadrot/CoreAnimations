//
//  ViewController.swift
//  PulsingCircleAnimation
//
//  Created by 1 on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pulseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pulseButton.layer.cornerRadius = pulseButton.frame.height / 2
        pulseButton.clipsToBounds = true
    }

    @IBAction func onClickPulseButton(_ sender: UIButton) {
        
        var red = UIColor(red: 255.0, green: 3, blue: 3, alpha: 0.4)
        let pulse = PulseAnimation(numberOfPulses: Float.infinity, radius: 200, position: sender.center)
        pulse.animatianDuration = 1.0
        pulse.backgroundColor = red.cgColor
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
}

