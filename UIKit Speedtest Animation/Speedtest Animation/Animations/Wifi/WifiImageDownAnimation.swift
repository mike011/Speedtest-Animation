//
//  WifiImageDownAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class WifiImageDownAnimation: TimerAnimation {

    var timer: Timer!

    private let title: UILabel
    private let imageVerticalConstraint: NSLayoutConstraint
    private let imageVerticalDefault: CGFloat

    init(args: WifiArgs) {
        self.title = args.title
        self.imageVerticalConstraint = args.imageVerticalConstraint
        self.imageVerticalDefault = imageVerticalConstraint.constant
    }

    func before() {
        title.alpha = 1.0
        imageVerticalConstraint.constant = imageVerticalDefault
    }

    func animate() {
        title.alpha -= 0.09
        imageVerticalConstraint.constant -= 19
    }

    func isFinished() -> Bool {
        return title.alpha <= 0
    }
}
