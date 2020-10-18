//
//  SpeedTestViewController.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-17.
//

import UIKit

class SpeedTestViewController: UIViewController {

    @IBOutlet weak var speedTestView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }

    func setGradientBackground() {
        let colorTop =  UIColor(named: "LightBackgroundColor")!.cgColor
        let colorBottom = UIColor(named: "DarkBackgroundColor")!.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        displayUploadAnimation()
    }

    fileprivate func displayUploadAnimation() {
        let emitter = CAEmitterLayer()

        let rect = CGRect(x: 0.0, y: 0.0, width: speedTestView.bounds.width, height: speedTestView.bounds.height)

        emitter.frame = rect
        emitter.emitterShape = CAEmitterLayerEmitterShape.circle
        emitter.emitterPosition = CGPoint(x: rect.width/2,
                                          y: rect.height/2)

        emitter.emitterCells = [createEmitterCell(withColor: "UploadParticleColor")]

        speedTestView.layer.addSublayer(emitter)
    }

    fileprivate func createEmitterCell(withColor named: String) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = createCircleImage(named: named).cgImage

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

    private func createCircleImage(named name: String) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 4, height: 4))
        return renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor(named: name)!.cgColor)
            ctx.cgContext.setLineWidth(10)

            let rectangle = CGRect(x: 0, y: 0, width: 4, height: 4)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
    }
}

