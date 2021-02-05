//
//  ViewController.swift
//  CoreAnimations
//
//  Created by 1 on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var toggleSwitch = true
    fileprivate let snow = ParticleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sky = GradientView()
        sky.startColor = UIColor(red: 0.1, green: 0.25, blue: 0.5, alpha: 1)
        sky.endColor = UIColor(red: 0.75, green: 0.8, blue: 0.9, alpha: 1)
        sky.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sky)
        
        NSLayoutConstraint.activate([
            
            sky.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sky.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sky.topAnchor.constraint(equalTo: view.topAnchor),
            sky.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        //MARK: - Gestures
        let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(oneTap))
        view.addGestureRecognizer(singleTapRecognizer)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeScreen))
        swipeLeftRecognizer.numberOfTouchesRequired = 1
        swipeLeftRecognizer.direction = .left
        view.addGestureRecognizer(swipeLeftRecognizer)
    }
}

//MARK: - SnowOn/SnowOff
extension ViewController {

    @objc func oneTap(tap: UITapGestureRecognizer?) {

        if self.toggleSwitch == true {

            snow.particleImage = UIImage(named: "snow-particle")
            snow.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(snow)
            
            NSLayoutConstraint.activate([
                snow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                snow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                snow.topAnchor.constraint(equalTo: view.topAnchor),
                snow.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
            toggleSwitch = false

        } else {

            snow.removeFromSuperview()
            toggleSwitch = true
        }
    }

}
//MARK: - rightSwipe
extension ViewController {

    @objc func changeScreen(swipe: UISwipeGestureRecognizer?) {

            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "CakeVC") as! CakeVC
            self.navigationController?.pushViewController(vc, animated: true)
    }
}
