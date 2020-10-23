//
//  TransferSpeedAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import UIKit

class UploadTransferSpeedAnimation: DispatchQueueAnimation {
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
        currentLabel.text = String(format: "%.2f", networkConnection.getUploadTransferRate());
    }

    func onCompletion() {
        finalLabel.text = currentLabel.text
        currentLabel.text = "-"
    }
}
