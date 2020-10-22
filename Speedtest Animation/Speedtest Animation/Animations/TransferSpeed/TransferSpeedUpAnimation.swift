//
//  TransferSpeedUpAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class TransferSpeedUpAnimation: TimerAnimation {

    var timer: Timer!

    private var verticalConstraint: NSLayoutConstraint
    private var transferSpeedView: UIView

    init(transferSpeedView: UIView,
         verticalConstraint: NSLayoutConstraint) {
        self.transferSpeedView = transferSpeedView
        self.verticalConstraint = verticalConstraint
    }

    func before() {
        transferSpeedView.isHidden = true
    }

    func animate() {
        verticalConstraint.constant += 16
    }

    func isFinished() -> Bool {
        return verticalConstraint.constant >= 600
    }
}

