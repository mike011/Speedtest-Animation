//
//  WifiLeftAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class WifiImageLeftAndTextDownAnimation: TimerAnimation {

    var timer: Timer!

    var title: UILabel
    var subtitle: UILabel
    var imageVerticalConstraint: NSLayoutConstraint
    var imageHorizontalConstraint: NSLayoutConstraint
    var textVerticalConstraint: NSLayoutConstraint

    init(title: UILabel,
         subtitle: UILabel,
         imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         textVerticalConstraint: NSLayoutConstraint) {
        self.title = title
        self.subtitle = subtitle
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.textVerticalConstraint = textVerticalConstraint
    }

    func before() {
        title.alpha = 0.0
        subtitle.alpha = 0.0
    }

    func animate() {
        title.alpha += 0.1
        subtitle.alpha += 0.1
        imageVerticalConstraint.constant += 3.22
        imageHorizontalConstraint.constant -= 4
        textVerticalConstraint.constant -= 1
    }

    func isFinished() -> Bool {
        return imageHorizontalConstraint.constant <= 20
    }
}
