//
//  WifiImageRightAndTextUpAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class WifiImageRightAndTextUpAnimation: TimerAnimation {

    var timer: Timer!

    private let subtitle: UILabel
    private let imageVerticalConstraint: NSLayoutConstraint
    private let imageVerticalStartValue: CGFloat
    private let imageHorizontalConstraint: NSLayoutConstraint
    private let imageHorizontalStartValue: CGFloat
    private let textVerticalConstraint: NSLayoutConstraint
    private let textHorizontalConstraint: NSLayoutConstraint

    init(subtitle: UILabel,
        imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         textVerticalConstraint: NSLayoutConstraint,
         textHorizontalConstraint: NSLayoutConstraint) {
        self.subtitle = subtitle
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageVerticalStartValue = imageVerticalConstraint.constant
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.imageHorizontalStartValue = imageHorizontalConstraint.constant
        self.textVerticalConstraint = textVerticalConstraint
        self.textHorizontalConstraint = textHorizontalConstraint
    }

    func before() {
        self.subtitle.alpha = 0
    }

    func animate() {
        imageVerticalConstraint.constant += 5
        imageHorizontalConstraint.constant += 3.6
        textVerticalConstraint.constant += 5
        textHorizontalConstraint.constant += 3.6
    }

    func isFinished() -> Bool {
        return imageVerticalConstraint.constant >= imageVerticalStartValue
    }

    func onCompletion() {
        imageVerticalConstraint.constant = imageVerticalStartValue
        imageHorizontalConstraint.constant = imageHorizontalStartValue
    }
}

