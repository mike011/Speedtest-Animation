//
//  DownloadAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-18.
//

import UIKit

class DownloadAnimation {

    private let view: UIView
    private let downloadColor: UIColor

    init(forView view: UIView) {
        self.view = view
        self.downloadColor = UIColor(named: "DownloadParticleColor")!
    }

    func display() {
        displayDownloadAnimation() // top left to right
        displayDownloadAnimation2() // top right to left
        displayDownloadAnimation3() // bottom left to right
        displayDownloadAnimation4() // bottom right to left
    }

    func remove() {
        view.layer.sublayers?.removeAll()
    }

    fileprivate func displayDownloadAnimation() {
        let emitter = CAEmitterLayer()

        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width/2, height: view.bounds.height)

        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize.width = view.bounds.width/2
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: rect.minY)

        emitter.emitterCells = [createDownloadEmitterCell()]

        view.layer.addSublayer(emitter)
    }

    fileprivate func createDownloadEmitterCell() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage.createCircle(withColor: downloadColor).cgImage

        emitterCell.birthRate = 5

        emitterCell.lifetime = 3.5
        emitterCell.lifetimeRange = 1.0

        emitterCell.yAcceleration = 10
        emitterCell.xAcceleration = 10
//
//        //emitterCell.emissionRange = .pi
        emitterCell.velocity = -20
//        emitterCell.velocityRange = 200
//
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15

        return emitterCell
    }

    fileprivate func displayDownloadAnimation2() {
        let emitter = CAEmitterLayer()

        let rect = CGRect(x: view.bounds.width/2, y: 0.0, width: view.bounds.width, height: view.bounds.height)

        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize.width = view.bounds.width/2
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: rect.minY)

        emitter.emitterCells = [createDownloadEmitterCell2()]

        view.layer.addSublayer(emitter)
    }

    fileprivate func createDownloadEmitterCell2() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage.createCircle(withColor: downloadColor).cgImage

        emitterCell.birthRate = 5

        emitterCell.lifetime = 3.5
        emitterCell.lifetimeRange = 1.0

        emitterCell.yAcceleration = 10
        emitterCell.xAcceleration = -10
//
//        //emitterCell.emissionRange = .pi
        emitterCell.velocity = -20
//        emitterCell.velocityRange = 200
//
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15

        return emitterCell
    }

    fileprivate func displayDownloadAnimation3() {
        let emitter = CAEmitterLayer()

        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width/2, height: view.bounds.height)

        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize.width = view.bounds.width/2
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: rect.maxY)

        emitter.emitterCells = [createDownloadEmitterCell3()]

        view.layer.addSublayer(emitter)
    }

    fileprivate func createDownloadEmitterCell3() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage.createCircle(withColor: downloadColor).cgImage

        emitterCell.birthRate = 5

        emitterCell.lifetime = 3.5
        emitterCell.lifetimeRange = 1.0

        emitterCell.yAcceleration = -10
        emitterCell.xAcceleration = 10
//
//        //emitterCell.emissionRange = .pi
        emitterCell.velocity = 20
//        emitterCell.velocityRange = 200
//
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        //emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15

        return emitterCell
    }

    fileprivate func displayDownloadAnimation4() {
        let emitter = CAEmitterLayer()

        let rect = CGRect(x: view.bounds.width/2, y: 0.0, width: view.bounds.width, height: view.bounds.height)

        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize.width = view.bounds.width/2
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: rect.maxY)

        emitter.emitterCells = [createDownloadEmitterCell4()]

        view.layer.addSublayer(emitter)
    }

    fileprivate func createDownloadEmitterCell4() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage.createCircle(withColor: downloadColor).cgImage

        emitterCell.birthRate = 5

        emitterCell.lifetime = 3.5
        emitterCell.lifetimeRange = 1.0

        emitterCell.yAcceleration = -10
        emitterCell.xAcceleration = -10
//
//        //emitterCell.emissionRange = .pi
        emitterCell.velocity = 20
//        emitterCell.velocityRange = 200

        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        //emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15

        return emitterCell
    }

}
