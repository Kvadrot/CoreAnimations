//
//  CakeVC.swift
//  CoreAnimations
//
//  Created by 1 on 04.02.2021.
//

import UIKit

class CakeVC: UIViewController {

    let confetti = СonfettiView()

    let cake = UIImage(named: "birthday-cake")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - backGroundGradient
        let myBackground = GradientView()
        myBackground.startColor = UIColor(red: 0.75, green: 0.8, blue: 0.9, alpha: 1)
        myBackground.endColor = UIColor(red: 0.1, green: 0.25, blue: 0.5, alpha: 1)
        myBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myBackground)
        
        //MARK: cakeImageAdding
        let imageView = UIImageView(image: cake)
        imageView.frame = CGRect(x: view.frame.width/2 - 100, y: view.frame.height - (imageView.frame.height + 200), width: 200, height: 400)
        view.addSubview(imageView)
        
        confetti.confettiImage = UIImage(named: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        
        //MARK: - Gestures
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeScreen))
        swipeLeftRecognizer.numberOfTouchesRequired = 1
        swipeLeftRecognizer.direction = .left
        view.addGestureRecognizer(swipeLeftRecognizer)
        
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeScreen))
        swipeRightRecognizer.numberOfTouchesRequired = 1
        swipeRightRecognizer.direction = .right
        view.addGestureRecognizer(swipeRightRecognizer)
        
        NSLayoutConstraint.activate([
            
            myBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myBackground.topAnchor.constraint(equalTo: view.topAnchor),
            myBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            confetti.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            confetti.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            confetti.topAnchor.constraint(equalTo: view.topAnchor),
            confetti.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    

}

//MARK: - navigationSwipes
extension CakeVC {

    @objc func changeScreen(swipe: UISwipeGestureRecognizer?) {

        if swipe?.direction == .left {

            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SaluteVC") as! SaluteVC
            self.navigationController?.pushViewController(vc, animated: true)

        } else if swipe?.direction == .right {

            self.navigationController?.popViewController(animated: true)
        }
    }
}


