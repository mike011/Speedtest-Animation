//
//  ServerView.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public struct ServerArgs {
    let title: UILabel
    let subtitle: UILabel
    let button: UIButton
    let imageVerticalConstraint: NSLayoutConstraint
    let imageVerticalDefault: CGFloat

    let imageHorizontalConstraint: NSLayoutConstraint
    let imageHorizontalDefault: CGFloat
    let dots: UIImageView

    init(title: UILabel,
         subtitle: UILabel,
         button: UIButton,
         imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint,
         dots: UIImageView) {
        self.title = title
        self.subtitle = subtitle
        self.button = button
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageVerticalDefault = imageVerticalConstraint.constant
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.imageHorizontalDefault = imageHorizontalConstraint.constant
        self.dots = dots
    }
}
