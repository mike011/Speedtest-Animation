//
//  SpeedTestCompleteHideButtonsAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class SpeedTestCompleteHideButtonsAnimation: TimerAnimation {
    var timer: Timer!

    private let view: UIView

    init(view: UIView) {
        self.view = view
    }

    func before() {
        view.isHidden = false
        view.alpha -= 1.0
    }

    func animate() {
        view.alpha -= 0.20
    }

    func isFinished() -> Bool {
        return view.alpha <= 0.0
    }
}
