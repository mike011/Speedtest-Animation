//
//  ServerView.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public struct ServerArgs {
    var title: UILabel
    var subtitle: UILabel
    var button: UIButton
    var imageVerticalConstraint: NSLayoutConstraint
    var imageVerticalDefault: CGFloat

    var imageHorizontalConstraint: NSLayoutConstraint
    var imageHorizontalDefault: CGFloat

    init(title: UILabel,
         subtitle: UILabel,
         button: UIButton,
         imageVerticalConstraint: NSLayoutConstraint,
         imageHorizontalConstraint: NSLayoutConstraint) {
        self.title = title
        self.subtitle = subtitle
        self.button = button
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageVerticalDefault = imageVerticalConstraint.constant
        self.imageHorizontalConstraint = imageHorizontalConstraint
        self.imageHorizontalDefault = imageHorizontalConstraint.constant
    }
}
