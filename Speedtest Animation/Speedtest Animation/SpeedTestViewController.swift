//
//  SpeedTestViewController.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-17.
//

import SpriteKit
import UIKit

class SpeedTestViewController: UIViewController {

    // MARK: - Speed Test
    @IBOutlet weak var speedTestView: UIView!
    private var speedTestDurationInSeconds = 1
    @IBOutlet weak var speedTestValuesView: UIView!
    @IBOutlet weak var transferImage: UIImageView!

    // MARK: - Transfer Speed
    @IBOutlet weak var transferSpeedView: UIView!
    @IBOutlet weak var transferSpeedLabel: UILabel!
    @IBOutlet weak var transferSpeedUnitsLabel: UILabel!
    @IBOutlet weak var downloadSpeedLabel: UILabel!
    @IBOutlet weak var uploadSpeedLabel: UILabel!

    // MARK: - Transfer Result View
    @IBOutlet weak var transferResultsView: UIView!

    // MARK: - Server
    @IBOutlet weak var serverTitle: UILabel!
    @IBOutlet weak var serverSubtitle: UILabel!
    @IBOutlet weak var serverButton: UIButton!
    @IBOutlet weak var serverImageVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var serverImageHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var serverTitleVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var serverTitleHorizontalConstraint: NSLayoutConstraint!

    // MARK: - WIFI
    @IBOutlet weak var wifiTitle: UILabel!
    @IBOutlet weak var wifiSubtitle: UILabel!
    @IBOutlet weak var wifiImageVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var wifiImageHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var wifiTitleHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var wifiTitleVerticalConstraint: NSLayoutConstraint!

    // MARK: - Start Button
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startButtonSKView: SKView!
    @IBOutlet weak var startButtonGlowView: UIImageView!

    // MARK: - Dots
    @IBOutlet weak var dotsImage: UIImageView!

    // MARK: - Speed Result
    @IBOutlet weak var speedResultVerticalConstraint: NSLayoutConstraint!

    // MARK: - Speed Test Complete Buttons
    @IBOutlet weak var speedTestFinishedButtons: UIView!

    private var viewsAnimationTimer: Timer?
    private var valuesAnimationTimer: Timer?
    private var startButtonPressedAnimations: [Animation]!
    private var speedTestFinishedAnimations: [Animation]!
    private var backButtonPressedAnimations: [Animation]!

    // MARK: - Setup
    override func viewWillAppear(_ animated: Bool) {
        view.setGradientBackground()
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startButtonPressedAnimations = getStartButtonAnimations()
        speedTestFinishedAnimations = getSpeedTestFinishedAnimations()
        backButtonPressedAnimations = getBackButtonPressedAnimations()
    }

    private func getStartButtonAnimations() -> [Animation] {
        var animations = [Animation]()
        animations.append(StartButtonAnimation(view: startButtonSKView, button: startButton))
        let serverArgs = ServerArgs(title: serverTitle,
                                    subtitle: serverSubtitle,
                                    button: serverButton,
                                    imageVerticalConstraint: serverImageVerticalConstraint,
                                    imageHorizontalConstraint: serverImageHorizontalConstraint,
                                    dots: dotsImage)
        animations.append(ServerImageDownAnimation(args: serverArgs))

        animations.append(StartButtonHideBackgroundAnimation(sKView: startButtonSKView, glowView: startButtonGlowView))

        let wifiArgs = WifiArgs(title: wifiTitle, imageVerticalConstraint: wifiImageVerticalConstraint)
        animations.append(WifiImageDownAnimation(args: wifiArgs))

        animations.append(SpeedTestValuesShowAnimation(view: speedTestValuesView))

        animations.append(TransferSpeedDownAnimation(verticalConstraint: speedResultVerticalConstraint))
        return animations
    }

    private func getSpeedTestFinishedAnimations()  -> [Animation] {
        var animations = [Animation]()
        animations.append(ServerImageLeftAndTextDownAnimation(
                            title: serverTitle,
                            subtitle: serverSubtitle,
                            imageVerticalConstraint: serverImageVerticalConstraint,
                            imageHorizontalConstraint: serverImageHorizontalConstraint,
                            titleVerticalConstraint: serverTitleVerticalConstraint,
                            titleHorizontalConstraint: serverTitleHorizontalConstraint,
                            dots: dotsImage))

        animations.append(WifiImageLeftAndTextDownAnimation(
                            title: wifiTitle,
                            subtitle: wifiSubtitle,
                            imageVerticalConstraint: wifiImageVerticalConstraint,
                            imageHorizontalConstraint: wifiImageHorizontalConstraint,
                            titleVerticalConstraint: wifiTitleVerticalConstraint,
                            titleHorizontalConstraint: wifiTitleHorizontalConstraint))

        animations.append(SpeedTestCompleteShowButtonsAnimation(view: speedTestFinishedButtons))
        animations.append(SpeedTestValuesHideAnimation(view: speedTestValuesView))

        animations.append(TransferSpeedUpAnimation(
                            transferSpeedView: transferSpeedView,
                            verticalConstraint: speedResultVerticalConstraint))

        animations.append(TransferResultsShowAnimation(view: transferResultsView))
        return animations
    }

    private func getBackButtonPressedAnimations()  -> [Animation] {
        var animations = [Animation]()
        animations.append(WifiImageRightAndTextUpAnimation(
                            subtitle: wifiSubtitle,
                            imageVerticalConstraint: wifiImageVerticalConstraint,
                            imageHorizontalConstraint: wifiImageHorizontalConstraint,
                            textVerticalConstraint: wifiTitleVerticalConstraint,
                            textHorizontalConstraint: wifiTitleHorizontalConstraint))
        animations.append(ServerImageRightAndTextUpAnimation(
                            subtitle: serverSubtitle,
                            imageVerticalConstraint: serverImageVerticalConstraint,
                            imageHorizontalConstraint: serverImageHorizontalConstraint,
                            textVerticalConstraint: serverTitleVerticalConstraint,
                            textHorizontalConstraint: serverTitleHorizontalConstraint,
                            button: serverButton))
        animations.append(SpeedTestCompleteHideButtonsAnimation(view: speedTestFinishedButtons))

        animations.append(StartButtonShowBackgroundAnimation(
                            sKView: startButtonSKView,
                            glowView: startButtonGlowView,
                            button: startButton))

        animations.append(TransferSpeedBackToStartAnimation(
                            transferSpeedView: transferSpeedView,
                            verticalConstraint: speedResultVerticalConstraint))

        animations.append(TransferResultsHideAnimation(view: transferResultsView))
        return animations

    }

    // MARK: - Start Button Pressed

    @IBAction func startButtonPressed(_ sender: Any) {
        showDownloadAnimation()
        startAnimations()
    }

    private func startAnimations() {
        for animation in startButtonPressedAnimations {
            animation.start()
        }
//        valuesAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { timer in
//            self.animateSpeedValuesViews()
//        }
    }

    private func animateSpeedValuesViews() {
        transferSpeedLabel.text = "\(getCurrentSpeed())"
    }

    private func getCurrentSpeed() -> String {
        let value = Float.random(in: 90..<250)
        return String(format: "%.2f", value);
    }

    private func showDownloadAnimation() {
        self.transferImage.isHidden = false
        self.transferImage.image = UIImage(named: "download")!
        let downloadAnimation = DownloadAnimation(forView: self.speedTestView)
        downloadAnimation.display()
        downloadAnimationCompleted(downloadAnimation)
    }

    private func downloadAnimationCompleted(_ downloadAnimation: DownloadAnimation) {
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            self.transferImage.image = UIImage(named: "upload")!
            downloadAnimation.remove()
            let uploadAnimation = UploadAnimation(forView: self.speedTestView)
            uploadAnimation.display()
            self.uploadAnimationCompleted(uploadAnimation)
        }
    }

    private func uploadAnimationCompleted(_ uploadAnimation: UploadAnimation) {
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            uploadAnimation.remove()
            self.testFinishedAnimations()
            self.transferImage.isHidden = true
        }
    }

    private func getDuration() -> DispatchTime {
        return .now() + .milliseconds(speedTestDurationInSeconds * 1000)
    }

    private func testFinishedAnimations() {
        for animation in speedTestFinishedAnimations {
            animation.start()
        }
    }

    // MARK: - Back Button Pressed
    @IBAction func backButtonPressed(_ sender: Any) {
        for animation in backButtonPressedAnimations {
            animation.start()
        }
    }
}

