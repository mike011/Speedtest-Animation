//
//  AnimationContainer.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation

class AnimationContainer: Animation {

    private let container: [Animation]

    init(animations: [Animation]) {
        container = animations
    }
    func start() {
        for animation in container {
            animation.start()
        }
    }

    func finish() {
        for animation in container {
            animation.finish()
        }
    }
}
