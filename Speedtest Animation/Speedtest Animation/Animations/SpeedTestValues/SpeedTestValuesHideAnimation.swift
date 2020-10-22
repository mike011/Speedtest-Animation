//
//  SpeedTestValuesHideAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class SpeedTestValuesHideAnimation: TimerAnimation {

    var timer: Timer!

    private var view: UIView

    init(view: UIView) {
        self.view = view
    }

    func before() {
        view.alpha = 1.0
    }

    func animate() {
        view.alpha -= 0.05
    }

    func isFinished() -> Bool {
        return view.alpha <= 0
    }

    func completion() {
        view.isHidden = true
    }
}
