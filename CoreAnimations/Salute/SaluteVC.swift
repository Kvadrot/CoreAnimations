//
//  SaluteVC.swift
//  CoreAnimations
//
//  Created by 1 on 04.02.2021.
//

import UIKit

class SaluteVC: UIViewController {

    let salute = SaluteView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let saluteBackGround = GradientView()
        saluteBackGround.startColor = UIColor(red: 0.1, green: 0.25, blue: 100, alpha: 1)
        saluteBackGround.endColor = UIColor(red: 0.75, green: 0.1, blue: 100, alpha: 1)
        saluteBackGround.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saluteBackGround)

        salute.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(salute)
        
        NSLayoutConstraint.activate([
            
            saluteBackGround.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saluteBackGround.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            saluteBackGround.topAnchor.constraint(equalTo: view.topAnchor),
            saluteBackGround.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            salute.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            salute.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            salute.topAnchor.constraint(equalTo: view.topAnchor),
            salute.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
