//
//  ServerAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class ServerImageDownAnimation: TimerAnimation {

    var timer: Timer!

    private let title: UILabel
    private let subtitle: UILabel
    private let button: UIButton
    private let imageVerticalConstraint: NSLayoutConstraint
    private let imageVerticalStartValue: CGFloat
    private let imageHorizontalConstraint: NSLayoutConstraint
    private let imageHorizontalStartValue: CGFloat
    private let dots: UIImageView

    init(args: ServerArgs) {
        self.title = args.title
        self.subtitle = args.subtitle
        self.button = args.button
        self.imageVerticalConstraint = args.imageVerticalConstraint
        self.imageVerticalStartValue = imageVerticalConstraint.constant
        self.imageHorizontalConstraint = args.imageHorizontalConstraint
        self.imageHorizontalStartValue = imageHorizontalConstraint.constant
        self.dots = args.dots
    }

    func before() {
        imageVerticalConstraint.constant = imageVerticalStartValue
        imageHorizontalConstraint.constant = imageHorizontalStartValue
        dots.isHidden = false
        dots.alpha = 0.0
        title.alpha = 1.0
    }

    func animate() {
        let alpha: CGFloat = 0.08
        title.alpha -= alpha
        subtitle.alpha -= alpha
        button.alpha -= alpha
        dots.alpha += alpha
        imageVerticalConstraint.constant -= 12.2
        imageHorizontalConstraint.constant += 7.8
    }

    func isFinished() -> Bool {
        return title.alpha <= 0
    }
}
