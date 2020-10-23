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
    private let imageHorizontalConstraint: NSLayoutConstraint
    private let dots: UIImageView

    init(args: ServerArgs) {
        self.title = args.title
        self.subtitle = args.subtitle
        self.button = args.button
        self.imageVerticalConstraint = args.imageVerticalConstraint
        self.imageHorizontalConstraint = args.imageHorizontalConstraint
        self.dots = args.dots
    }

    func before() {
        dots.isHidden = false
        dots.alpha = 0.0
        title.alpha = 1.0
    }

    func animate() {
        title.alpha -= 0.05
        subtitle.alpha -= 0.05
        button.alpha -= 0.05
        dots.alpha += 0.10
        imageVerticalConstraint.constant -= 8.0
        imageHorizontalConstraint.constant += 4.8
    }

    func isFinished() -> Bool {
        return title.alpha <= 0
    }
}
