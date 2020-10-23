//
//  WifiView.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public struct WifiArgs {
    let title: UILabel
    let imageVerticalConstraint: NSLayoutConstraint
    let imageVerticalDefault: CGFloat

    init(title: UILabel,
         imageVerticalConstraint: NSLayoutConstraint) {
        self.title = title
        self.imageVerticalConstraint = imageVerticalConstraint
        self.imageVerticalDefault = imageVerticalConstraint.constant
    }
}
