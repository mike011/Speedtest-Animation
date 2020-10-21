//
//  StartButtonBackgroundHideAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import SpriteKit
import UIKit

public class StartButtonHideBackgroundAnimation: TimerAnimation {
    public var timer: Timer!

    private var sKView: SKView
    private var glowView: UIImageView

    init(sKView: SKView, glowView: UIImageView) {
        self.sKView = sKView
        self.glowView = glowView
    }

    public func before() {
        sKView.alpha = 1.0
        glowView.alpha = 1.0
    }

    public func animate() {
        sKView.alpha -= 0.1
        glowView.alpha -= 0.1
    }

    public func isFinished() -> Bool {
        glowView.alpha <= 0.0
    }
}
