//
//  MetricsResultsHideAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

class MetricsResultsHideAnimation: TimerAnimation {

    var timer: Timer!

    private let view: UIView

    init(view: UIView) {
        self.view = view
    }

    public func before() {
        view.alpha = 1.0
        view.isHidden = false
    }

    public func animate() {
        view.alpha -= 0.05
    }

    public func isFinished() -> Bool {
        return view.alpha <= 0.0
    }

    public func onCompletion() {
        view.isHidden = true
    }
}
