//
//  TransferSpeedAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import UIKit

class DownloadTransferSpeedAnimation: TimerAnimation {
    var timer: Timer!

    private let networkConnection:Connection
    private let currentLabel: UILabel
    private let finalLabel: UILabel

    init(networkConnection: Connection, currentLabel: UILabel, finalLabel: UILabel) {
        self.networkConnection = networkConnection
        self.currentLabel = currentLabel
        self.finalLabel = finalLabel
    }
    func animate() {
        currentLabel.text = String(format: "%.2f", networkConnection.getCurrentTransferRate());
    }

    func isFinished() -> Bool {
        return false
    }

    func onCompletion() {
        finalLabel.text = currentLabel.text
    }
}
