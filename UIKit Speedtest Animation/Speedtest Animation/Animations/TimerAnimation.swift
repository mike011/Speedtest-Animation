//
//  Animation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public protocol TimerAnimation: Animation, Sendable {
    var timer: Timer! {get set}
    func animate()
    func isFinished() -> Bool
    func before()
    func onCompletion()
}

extension TimerAnimation {
    public func start() {
        before()
        timer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { [weak self] _ in
            guard let self else {
                return
            }
            MainActor.assumeIsolated {
                self.animate()
                if self.isFinished() {
                    self.finish()
                }
            }
        }
    }

    public func finish() {
        onCompletion()
        timer.invalidate()
    }

    public func before() {
    }
    
    public func onCompletion() {
    }
}
