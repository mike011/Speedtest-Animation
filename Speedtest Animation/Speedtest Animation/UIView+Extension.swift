//
//  UIView+Extension.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-18.
//

import UIKit

extension UIView {

    func setGradientBackground() {
        let colorTop =  UIColor(named: "LightBackgroundColor")!.cgColor
        let colorBottom = UIColor(named: "DarkBackgroundColor")!.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at:0)
    }
}
