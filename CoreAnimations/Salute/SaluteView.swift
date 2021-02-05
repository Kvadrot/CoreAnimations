//
//  SaluteView.swift
//  CoreAnimations
//
//  Created by 1 on 04.02.2021.
//

import UIKit

class SaluteView: UIView {
    
    var spark: UIImage?
    var tspark: UIImage?

    let emitterCell = CAEmitterCell()
    let trailCell = CAEmitterCell()
    let fireworkCell = CAEmitterCell()
    
    
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let emitterLayer = self.layer as! CAEmitterLayer
        
        emitterLayer.emitterSize = CGSize(width: self.bounds.width, height: 5)
        emitterLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.maxY)
        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive

        setupEmitterCell()

        emitterLayer.emitterCells = [emitterCell]
    }
    
    func setupEmitterCell() {
        emitterCell.color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1).cgColor

        emitterCell.redRange = 0.9
        emitterCell.greenRange = 0.9
        emitterCell.blueRange = 0.9
        emitterCell.lifetime = 2.5
        emitterCell.birthRate = 1
        emitterCell.velocity = -300

        emitterCell.velocityRange = 100
        emitterCell.emissionRange = CGFloat.pi / 4
        emitterCell.emissionLongitude = CGFloat.pi / 2
        emitterCell.yAcceleration = 100
        
        setupFireworkCell()
        setupTrailCell()
        
        emitterCell.emitterCells = [trailCell, fireworkCell]
    }
    
    func setupTrailCell() {
        trailCell.contents = UIImage(named: "tspark")?.cgImage
        trailCell.lifetime = 0.5
        trailCell.birthRate = 45
        trailCell.velocity = 80
        trailCell.scale = 0.4
        trailCell.alphaSpeed = -0.7
        trailCell.scaleSpeed = -0.1
        trailCell.scaleRange = 0.1
        trailCell.beginTime = 0.01
        trailCell.duration = 1.7
        trailCell.emissionRange = CGFloat.pi / 8
        trailCell.emissionLongitude = CGFloat.pi * 2
        trailCell.yAcceleration = 1000
    }
    
    func setupFireworkCell() {
        fireworkCell.contents = UIImage(named: "spark")?.cgImage
        fireworkCell.lifetime = 100
        fireworkCell.birthRate = 500
        fireworkCell.velocity = 130
        fireworkCell.scale = 0.6
        fireworkCell.spin = 2
        fireworkCell.alphaSpeed = -0.2
        fireworkCell.scaleSpeed = -0.1
        fireworkCell.beginTime = 1.5
        fireworkCell.duration = 0.1
        fireworkCell.emissionRange = CGFloat.pi * 2
        fireworkCell.yAcceleration = -80
    }
    
}
