//
//  WifiImageLeftAndTextDownAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class WifiImageLeftAndTextDownAnimation: TimerAnimation {

    var timer: Timer!

    private let title: UILabel
    private let subtitle: UILabel
    private let imageVerticalConstraint: NSLayoutConstraint
    private let imageHorizontalConstraint: NSLayoutConstraint
    private let titleVerticalConstraint: NSLayoutConstraint
    private let titleHorizontalConstraint: NSLayoutConstraint

    init(title: UILabel,
         subtitle: UILabel,
         imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         titleVerticalConstraint: NSLayoutConstraint,
         titleHorizontalConstraint: NSLayoutConstraint) {
        self.title = title
        self.subtitle = subtitle
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.titleVerticalConstraint = titleVerticalConstraint
        self.titleHorizontalConstraint = titleHorizontalConstraint
    }

    func before() {
        titleVerticalConstraint.constant = 150
        titleHorizontalConstraint.constant = 68
        title.alpha = 0.0
        subtitle.alpha = 0.0
    }

    func animate() {
        title.alpha += 0.1
        subtitle.alpha += 0.1
        imageVerticalConstraint.constant += 3.22
        imageHorizontalConstraint.constant -= 4
        titleVerticalConstraint.constant -= 1
    }

    func isFinished() -> Bool {
        return imageHorizontalConstraint.constant <= 20
    }
}
