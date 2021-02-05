//
//  Confetee.swift
//  CoreAnimations
//
//  Created by 1 on 04.02.2021.
//

import UIKit

struct Mycolors {

    let red = UIColor(red: 200, green: 0.2, blue: 0.2, alpha: 1)
    let blue = UIColor(red: 0.2, green: 0.2, blue: 200, alpha: 1)
    let green = UIColor(red: 0.2, green: 200, blue: 0.2, alpha: 1)
    lazy var arrayOfColors: [UIColor] = [ red, blue, green]

    mutating func chooseRandomColor() -> UIColor {

        let element = arrayOfColors.randomElement()
        arrayOfColors.remove(at: arrayOfColors.firstIndex(where: {$0 === element})!)

        return element!
    }

}

class СonfettiView: UIView {

    var confettiImage: UIImage?
    private var color = Mycolors()

    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }

    func makeEmitterCell(color: UIColor, velocity: CGFloat, scale: CGFloat) -> CAEmitterCell {

        let cell = CAEmitterCell()
        cell.birthRate = Float.random(in: 1...6)
        cell.lifetime = 20.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = velocity
        cell.velocityRange = velocity / 8
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 4
        cell.scale = scale
        cell.scaleRange = scale / 3
        cell.spin = 2
        cell.spinRange = 2

        cell.contents = confettiImage?.cgImage
        return cell
    }

    override func layoutSubviews() {
            let emitter = self.layer as! CAEmitterLayer

            emitter.emitterShape = .line
            emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
            emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)

        let near = makeEmitterCell(color: color.chooseRandomColor(), velocity: 400, scale: CGFloat(Double.random(in: 0.5...0.8)))

        let middle = makeEmitterCell(color: color.chooseRandomColor(), velocity: 400, scale: CGFloat(Double.random(in: 0.9...1.3)))

        let far = makeEmitterCell(color: color.chooseRandomColor(), velocity: 400, scale: CGFloat(Double.random(in: 1.4...1.7)))

            emitter.emitterCells = [near, middle, far]
        }


}
