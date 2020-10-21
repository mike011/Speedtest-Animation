//
//  SpeedTestCompleteHideButtonsAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public class SpeedTestCompleteHideButtonsAnimation: TimerAnimation {
    public var timer: Timer!

    private var view: UIView

    init(view: UIView) {
        self.view = view
    }

    public func before() {
        view.isHidden = false
        view.alpha -= 1.0
    }

    public func animate() {
        view.alpha -= 0.20
    }

    public func isFinished() -> Bool {
        return view.alpha <= 0.0
    }
}
