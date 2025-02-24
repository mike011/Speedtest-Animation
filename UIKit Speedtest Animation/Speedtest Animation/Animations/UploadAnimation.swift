//
//  UploadAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-18.
//

import UIKit

class UploadAnimation: Animation {

    private let view: UIView
    private let downloadColor: UIColor

    init(forView view: UIView) {
        self.view = view
        self.downloadColor = UIColor(named: "UploadParticleColor")!
    }

    func start() {
        view.layer.sublayers?.removeAll()
        displayUploadAnimation()
    }

    func finish() {
        view.layer.sublayers?.removeAll()
    }

    fileprivate func displayUploadAnimation() {
        let emitter = CAEmitterLayer()

        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: view.bounds.height)

        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.circle
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: rect.height/2)

        emitter.emitterCells = [createUploadEmitterCell()]

        view.layer.addSublayer(emitter)
    }

    fileprivate func createUploadEmitterCell() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        let uploadColor = UIColor(named: "UploadParticleColor")!
        emitterCell.contents = UIImage.createCircle(withColor: uploadColor).cgImage

        emitterCell.birthRate = 20

        emitterCell.lifetime = 3.5
        emitterCell.lifetimeRange = 1.0

        emitterCell.yAcceleration = 10
        emitterCell.xAcceleration = 10

        emitterCell.emissionRange = .pi
        emitterCell.velocity = 20
        emitterCell.velocityRange = 200

        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15

        return emitterCell
    }
}
