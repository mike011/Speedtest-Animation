//
//  ResetTransferSpeedsAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation
import UIKit

class ResetTransferSpeedsAnimation: TimerAnimation {
    public var timer: Timer!

    private var upload: UILabel
    private var download: UILabel

    init(upload: UILabel, download: UILabel) {
        self.upload = upload
        self.download = download
    }

    public func animate() {
        upload.alpha -= 0.05
        download.alpha -= 0.05
    }

    public func isFinished() -> Bool {
        return upload.alpha <= 0.0
    }

    func onCompletion() {
        upload.alpha = 1.0
        upload.text = "-"
        download.alpha = 1.0
        download.text = "-"
    }
}
