//
//  MetricsLiveAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation

class MetricsLiveDownloadAnimation: DispatchQueueAnimation {

    var timer: Timer!
    private let connection: Connection
    private let liveMetrics: Metrics

    init(connection: Connection, liveMetrics: Metrics) {
        self.connection = connection
        self.liveMetrics = liveMetrics
    }

    func animate() {
        liveMetrics.ping.text = String(format: "%.1f", connection.getPing());
        liveMetrics.jitter.text = String(format: "%.1f", connection.getJitter());
        liveMetrics.loss.text = String(format: "%.0f", connection.getLoss());
    }
}
