//
//  ServerImageRightAndTextUpAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class ServerImageRightAndTextUpAnimation: TimerAnimation {

    var timer: Timer!

    private var subtitle: UILabel
    private var imageVerticalConstraint: NSLayoutConstraint
    private var imageVerticalStartValue: CGFloat
    private var imageHorizontalConstraint: NSLayoutConstraint
    private var imageHorizontalStartValue: CGFloat
    private var textVerticalConstraint: NSLayoutConstraint
    private var textHorizontalConstraint: NSLayoutConstraint
    private var button: UIButton

    init(subtitle: UILabel,
        imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         textVerticalConstraint: NSLayoutConstraint,
         textHorizontalConstraint: NSLayoutConstraint,
         button: UIButton) {
        self.subtitle = subtitle
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageVerticalStartValue = imageVerticalConstraint.constant
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.imageHorizontalStartValue = imageHorizontalConstraint.constant
        self.textVerticalConstraint = textVerticalConstraint
        self.textHorizontalConstraint = textHorizontalConstraint
        self.button = button
    }

    func before() {
        subtitle.alpha = 0
    }

    func animate() {
        subtitle.alpha += 0.06
        let horizontal: CGFloat = 4
        imageHorizontalConstraint.constant += horizontal
        textHorizontalConstraint.constant += horizontal
    }

    func isFinished() -> Bool {
        return imageHorizontalConstraint.constant >= imageHorizontalStartValue
    }

    func onCompletion() {
        imageVerticalConstraint.constant = imageVerticalStartValue
        imageHorizontalConstraint.constant = imageHorizontalStartValue
        button.alpha = 1.0
        subtitle.alpha = 1.0
    }
}

