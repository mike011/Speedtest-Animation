//
//  Animation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public protocol Animation: class {
    func start()
}

public protocol TimerAnimation: Animation {
    var timer: Timer! {get set}
    func animate()
    func isFinished() -> Bool
    func before()
    func completion()
}

extension TimerAnimation {
    public func start() {
        before()
        timer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { [weak self] timer in
            guard let self = self else {
                return
            }
            self.animate()
            if self.isFinished() {
                self.completion()
                timer.invalidate()
            }
        }
    }

    public func before() {
    }
    
    public func completion() {
    }
}
