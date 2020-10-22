//
//  TransferSpeedDownAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class TransferSpeedDownAnimation: TimerAnimation {

    var timer: Timer!

    private var verticalConstraint: NSLayoutConstraint
    private var defaultValue: CGFloat

    init(verticalConstraint: NSLayoutConstraint) {
        self.verticalConstraint = verticalConstraint
        self.defaultValue = verticalConstraint.constant
    }

    func before() {
        verticalConstraint.constant = defaultValue
    }

    func animate() {
        verticalConstraint.constant -= 16
    }

    func isFinished() -> Bool {
        return verticalConstraint.constant <= 100
    }
}

