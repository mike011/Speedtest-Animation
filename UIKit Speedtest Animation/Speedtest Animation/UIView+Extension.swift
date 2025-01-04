//
//  UIView+Extension.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-18.
//

import SwiftUI
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

#Preview {
    Text("Gradient Background")
    TextView()
}

private struct TextView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 500))
        v.setGradientBackground()
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
