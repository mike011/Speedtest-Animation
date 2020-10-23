//
//  DispatchQueueAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation

public protocol DispatchQueueAnimation: TimerAnimation {
}

extension DispatchQueueAnimation {
    func isFinished() -> Bool {
        return false
    }
}
