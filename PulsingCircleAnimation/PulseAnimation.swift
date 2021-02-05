//
//  PulseAnimation.swift
//  PulsingCircleAnimation
//
//  Created by 1 on 02.02.2021.
//

import Foundation
import UIKit

class PulseAnimation: CALayer {

    var animationGroup =  CAAnimationGroup()
    var animatianDuration: TimeInterval = 1.2
    var radius: CGFloat = 200
    var numberOfPulses: Float = 10

    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(numberOfPulses: Float = 10, radius: CGFloat, position: CGPoint) {

        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setUpAnimationGroup()
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
    }
    
    func scaleAniation() -> CABasicAnimation {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animatianDuration
        return scaleAnimation
    }
    
    func createOpacityanimation() -> CAKeyframeAnimation {

        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animatianDuration
        opacityAnimation.keyTimes = [0, 0.3, 1]
        opacityAnimation.values = [0.4, 0.8, 0]

        return opacityAnimation
    }
    
    func setUpAnimationGroup() {
        self.animationGroup.duration = animatianDuration
        self.animationGroup.repeatCount = numberOfPulses
        let defaultCurve = CAMediaTimingFunction(name: .default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAniation(), createOpacityanimation()]
        
    }
}
