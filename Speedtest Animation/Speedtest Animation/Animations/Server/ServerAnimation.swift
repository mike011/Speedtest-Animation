//
//  ServerAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import UIKit

public class ServerAnimation: TimerAnimation {

    public var timer: Timer!

    var title: UILabel
    private var subtitle: UILabel
    private var button: UIButton
    private var imageVerticalConstraint: NSLayoutConstraint
    private var imageVerticalDefault: CGFloat

    var imageHorizontalConstraint: NSLayoutConstraint
    var imageHorizontalDefault: CGFloat

    init(args: ServerArgs) {
        self.title = args.title
        self.subtitle = args.subtitle
        self.button = args.button
        self.imageVerticalConstraint = args.imageVerticalConstraint
        self.imageVerticalDefault = args.imageVerticalConstraint.constant
        self.imageHorizontalConstraint = args.imageHorizontalConstraint
        self.imageHorizontalDefault = args.imageHorizontalConstraint.constant
    }

    public func animate() {
        title.alpha -= 0.2
        subtitle.alpha -= 0.2
        button.alpha -= 0.2
        imageVerticalConstraint.constant -= 12.5
        imageHorizontalConstraint.constant += 10
    }

    public func isFinished() -> Bool {
        return false
    }
}


public class ServerForwardAnimation: ServerAnimation {

    override public func isFinished() -> Bool {
        return title.alpha <= 0
    }
}


public class ServerBackwardAnimation: ServerAnimation {

    override public func isFinished() -> Bool {
        return imageHorizontalDefault == imageHorizontalConstraint.constant
    }
}
