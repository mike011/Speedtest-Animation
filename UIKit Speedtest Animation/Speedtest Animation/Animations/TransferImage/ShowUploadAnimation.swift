//
//  ShowUploadAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import UIKit

class ShowUploadAnimation: DispatchQueueAnimation {

    var timer: Timer!

    private let imageView: UIImageView

    init(image: UIImageView) {
        self.imageView = image
    }

    public func before() {
        imageView.image = UIImage(named: "upload")!
        imageView.alpha = 0.0
    }

    public func animate() {
        imageView.alpha += 0.05
    }

    public func isFinished() -> Bool {
        return imageView.alpha > 1.0
    }
}
