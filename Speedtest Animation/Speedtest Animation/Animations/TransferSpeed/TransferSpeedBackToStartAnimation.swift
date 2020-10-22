//
//  TransferSpeedBackToStartAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class TransferSpeedBackToStartAnimation: TimerAnimation {

    var timer: Timer!

    private var transferSpeedView: UIView
    private var verticalConstraint: NSLayoutConstraint
    private var defaultValue: CGFloat

    init(transferSpeedView: UIView,
         verticalConstraint: NSLayoutConstraint) {
        self.transferSpeedView = transferSpeedView
        self.verticalConstraint = verticalConstraint
        self.defaultValue = verticalConstraint.constant
    }

    func animate() {
        verticalConstraint.constant -= 16
    }

    func isFinished() -> Bool {
        return verticalConstraint.constant <= defaultValue
    }

    func onCompletion() {
        verticalConstraint.constant = defaultValue
        transferSpeedView.isHidden = false
    }
}

