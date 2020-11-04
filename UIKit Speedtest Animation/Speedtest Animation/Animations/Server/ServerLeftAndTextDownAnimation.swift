//
//  ServerImageLeftAndTextDownAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import Foundation

import UIKit

class ServerImageLeftAndTextDownAnimation: TimerAnimation {

    var timer: Timer!

    private let title: UILabel
    private let subtitle: UILabel
    private let imageVerticalConstraint: NSLayoutConstraint
    private let imageHorizontalConstraint: NSLayoutConstraint
    private let titleVerticalConstraint: NSLayoutConstraint
    private let titleHorizontalConstraint: NSLayoutConstraint
    private let dots: UIImageView

    init(title: UILabel,
         subtitle: UILabel,
         imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         titleVerticalConstraint: NSLayoutConstraint,
         titleHorizontalConstraint: NSLayoutConstraint,
         dots: UIImageView) {
        self.title = title
        self.subtitle = subtitle
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.titleVerticalConstraint = titleVerticalConstraint
        self.titleHorizontalConstraint = titleHorizontalConstraint
        self.dots = dots
    }

    func before() {
        titleVerticalConstraint.constant = 240
        titleHorizontalConstraint.constant = 68
        dots.alpha = 0
        title.alpha = 0.0
        subtitle.alpha = 0.0
    }

    func animate() {
        let alpha: CGFloat = 0.1
        title.alpha += alpha
        subtitle.alpha += alpha
        dots.alpha -= alpha
        imageVerticalConstraint.constant += 5.2
        imageHorizontalConstraint.constant -= 6.6
        titleVerticalConstraint.constant -= 1.2
    }

    func isFinished() -> Bool {
        return imageHorizontalConstraint.constant <= 20
    }
}
