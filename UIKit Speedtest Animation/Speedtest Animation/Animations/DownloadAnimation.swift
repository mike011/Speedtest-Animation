//
//  DownloadAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-18.
//

import UIKit

class DownloadAnimation: Animation {

    private let view: UIView
    private let downloadColor: UIColor

    init(forView view: UIView) {
        self.view = view
        self.downloadColor = UIColor(named: "DownloadParticleColor")!
    }

    func start() {
        displayTopLeftAnimation()
        displayTopRightAnimation()
        displayBottomLeftAnimation()
        displayBottomRightAnimation()
    }

    func finish() {
    }

    fileprivate func displayTopLeftAnimation() {
        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width/3, height: view.bounds.height)
        createEmitter(rect: rect, xAcceleration: 10, yAcceleration: 10, velocity: -20, yEmitterPosition: rect.minY)
    }

    fileprivate func displayTopRightAnimation() {
        let rect = CGRect(x: view.bounds.width/3, y: 0.0, width: view.bounds.width, height: view.bounds.height)
        createEmitter(rect: rect, xAcceleration: -10, yAcceleration: 10, velocity: -20, yEmitterPosition: rect.minY)
    }

    fileprivate func displayBottomLeftAnimation() {
        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width/3, height: view.bounds.height)
        createEmitter(rect: rect, xAcceleration: 10, yAcceleration: -10, velocity: 20, yEmitterPosition: rect.maxY)
    }

    fileprivate func displayBottomRightAnimation() {
        let rect = CGRect(x: view.bounds.width/3, y: 0.0, width: view.bounds.width, height: view.bounds.height)
        createEmitter(rect: rect, xAcceleration: -10, yAcceleration: -10, velocity: 20, yEmitterPosition: rect.maxY)
    }

    private func createEmitter(rect: CGRect, xAcceleration: CGFloat, yAcceleration: CGFloat, velocity: CGFloat, yEmitterPosition: CGFloat
    ) {
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize.width = view.bounds.width/2
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: yEmitterPosition)

        emitter.emitterCells = [createDownloadEmitterCell(xAcceleration: xAcceleration, yAcceleration: yAcceleration, velocity: velocity)]

        view.layer.addSublayer(emitter)
    }

    private func createDownloadEmitterCell(xAcceleration: CGFloat, yAcceleration: CGFloat, velocity: CGFloat) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage.createCircle(withColor: downloadColor).cgImage

        emitterCell.birthRate = 2.5

        emitterCell.lifetime = 4.5
        emitterCell.lifetimeRange = 1.0

        emitterCell.xAcceleration = xAcceleration
        emitterCell.yAcceleration = yAcceleration

        emitterCell.velocity = velocity

        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.90
        emitterCell.alphaSpeed = -0.05

        return emitterCell
    }
}
