//
//  ServerView.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public struct Server {
    private var title: UILabel
    private var subtitle: UILabel
    private var button: UIButton
    private var verticalConstraint: NSLayoutConstraint
    private var verticalDefault: CGFloat

    private var horizontalConstraint: NSLayoutConstraint
    private var hoorizontalDefault: CGFloat

    init(title: UILabel,
         subtitle: UILabel,
         button: UIButton,
         verticalConstraint: NSLayoutConstraint,
         horizontalConstraint: NSLayoutConstraint
    ) {
        self.title = title
        self.subtitle = subtitle
        self.button = button
        self.verticalConstraint = verticalConstraint
        self.verticalDefault = verticalConstraint.constant
        self.horizontalConstraint = horizontalConstraint
        self.hoorizontalDefault = horizontalConstraint.constant
    }

    func animate() {
        title.alpha -= 0.1
        subtitle.alpha -= 0.1
        button.alpha -= 0.1
        verticalConstraint.constant -= 12.5
        horizontalConstraint.constant += 10
    }
}
