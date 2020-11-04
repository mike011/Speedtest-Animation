//
//  StartButtonShowBackgroundAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import SpriteKit
import UIKit

class StartButtonShowBackgroundAnimation: TimerAnimation {
    var timer: Timer!

    private let sKView: SKView
    private let glowView: UIImageView
    private let button: UIButton

    init(sKView: SKView, glowView: UIImageView, button: UIButton) {
        self.sKView = sKView
        self.glowView = glowView
        self.button = button
    }

    func before() {
        glowView.alpha = 0.0
    }

    func animate() {
        glowView.alpha += 0.1
    }

    func isFinished() -> Bool {
        return glowView.alpha >= 1.0
    }

    func onCompletion() {
        button.isHidden = false
    }
}

