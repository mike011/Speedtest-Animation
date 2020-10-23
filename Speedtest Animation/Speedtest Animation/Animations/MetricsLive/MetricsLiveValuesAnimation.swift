//
//  MetricsLiveAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation

class MetricsLiveAnimation: TimerAnimation {

    var timer: Timer!
    private let connection: Connection
    private let liveMetrics: Metrics
    private let resultMetrics: Metrics

    init(connection: Connection, liveMetrics: Metrics, resultMetrics: Metrics) {
        self.connection = connection
        self.liveMetrics = liveMetrics
        self.resultMetrics = resultMetrics
    }

    func animate() {
        liveMetrics.ping.text = String(format: "%.1f", connection.getPing());
        liveMetrics.jitter.text = String(format: "%.1f", connection.getJitter());
        liveMetrics.loss.text = String(format: "%.0f", connection.getLoss());
    }

    func isFinished() -> Bool {
        return false
    }

    func onCompletion() {
        resultMetrics.ping.text = liveMetrics.ping.text
        resultMetrics.jitter.text = liveMetrics.jitter.text
        resultMetrics.loss.text = liveMetrics.loss.text
    }
}
