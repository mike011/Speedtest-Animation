//
//  StartButtonShowBackgroundAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import SpriteKit
import UIKit

public class StartButtonShowBackgroundAnimation: TimerAnimation {
    public var timer: Timer!

    private var sKView: SKView
    private var glowView: UIImageView
    private var button: UIButton

    init(sKView: SKView, glowView: UIImageView, button: UIButton) {
        self.sKView = sKView
        self.glowView = glowView
        self.button = button
    }

    public func before() {
        glowView.alpha = 0.0
    }

    public func animate() {
        glowView.alpha += 0.1
    }

    public func isFinished() -> Bool {
        return glowView.alpha >= 1.0
    }

    public func completion() {
        button.isHidden = false
    }
}

