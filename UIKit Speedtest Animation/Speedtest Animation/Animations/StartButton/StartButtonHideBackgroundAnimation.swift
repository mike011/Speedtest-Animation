//
//  StartButtonBackgroundHideAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import SpriteKit
import UIKit

class StartButtonHideBackgroundAnimation: TimerAnimation {
    var timer: Timer!

    private let sKView: SKView
    private let glowView: UIImageView

    init(sKView: SKView, glowView: UIImageView) {
        self.sKView = sKView
        self.glowView = glowView
    }

    func before() {
        sKView.alpha = 1.0
        glowView.alpha = 1.0
    }

    func animate() {
        sKView.alpha -= 0.1
        glowView.alpha -= 0.1
    }

    func isFinished() -> Bool {
        glowView.alpha <= 0.0
    }
}
