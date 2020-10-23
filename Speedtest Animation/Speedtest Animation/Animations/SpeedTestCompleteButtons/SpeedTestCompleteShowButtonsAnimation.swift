//
//  SpeedTestCompleteShowButtonsAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class SpeedTestCompleteShowButtonsAnimation: TimerAnimation {
    var timer: Timer!

    private let view: UIView

    init(view: UIView) {
        self.view = view
    }

    func before() {
        view.alpha = 0
        view.isHidden = false
    }

    func animate() {
        view.alpha += 0.05
    }

    func isFinished() -> Bool {
        return view.alpha >= 1.0
    }
}
