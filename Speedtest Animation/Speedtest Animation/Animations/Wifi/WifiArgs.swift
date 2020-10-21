//
//  WifiView.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public struct WifiArgs {
    var title: UILabel
    var imageVerticalConstraint: NSLayoutConstraint
    var imageVerticalDefault: CGFloat

    init(title: UILabel,
         imageVerticalConstraint: NSLayoutConstraint) {
        self.title = title
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageVerticalDefault = imageVerticalConstraint.constant
    }
}
