//
//  ServerImageLeftAndTextDownAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import Foundation

import UIKit

class ServerImageLeftAndTextDownAnimation: TimerAnimation {

    var timer: Timer!

    var title: UILabel
    var subtitle: UILabel
    var imageVerticalConstraint: NSLayoutConstraint
    var imageHorizontalConstraint: NSLayoutConstraint
    var titleVerticalConstraint: NSLayoutConstraint
    var titleHorizontalConstraint: NSLayoutConstraint
    var dots: UIImageView

    init(title: UILabel,
         subtitle: UILabel,
         imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         titleVerticalConstraint: NSLayoutConstraint,
         titleHorizontalConstraint: NSLayoutConstraint,
         dots: UIImageView) {
        self.title = title
        self.subtitle = subtitle
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.titleVerticalConstraint = titleVerticalConstraint
        self.titleHorizontalConstraint = titleHorizontalConstraint
        self.dots = dots
    }

    func before() {
        titleVerticalConstraint.constant = 240
        titleHorizontalConstraint.constant = 68
        dots.alpha = 0
        title.alpha = 0.0
        subtitle.alpha = 0.0
    }

    func animate() {
        title.alpha += 0.1
        subtitle.alpha += 0.1
        dots.alpha -= 0.1
        imageVerticalConstraint.constant += 3.22
        imageHorizontalConstraint.constant -= 4
        titleVerticalConstraint.constant -= 0.8
    }

    func isFinished() -> Bool {
        return imageHorizontalConstraint.constant <= 20
    }
}
