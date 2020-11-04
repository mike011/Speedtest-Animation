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
    private var speedTestDurationInSeconds = 3
    @IBOutlet weak var transferImage: UIImageView!

    // MARK: - Transfer Speed
    @IBOutlet weak var transferSpeedView: UIView!
    @IBOutlet weak var transferSpeedLabel: UILabel!
    @IBOutlet weak var transferSpeedUnitsLabel: UILabel!
    @IBOutlet weak var downloadSpeedLabel: UILabel!
    @IBOutlet weak var uploadSpeedLabel: UILabel!

    // MARK: - Metrics
    @IBOutlet weak var metricsLiveView: UIView!
    @IBOutlet weak var livePingLabel: UILabel!
    @IBOutlet weak var liveJitterLabel: UILabel!
    @IBOutlet weak var liveLossLabel: UILabel!

    @IBOutlet weak var metricsResultsView: UIView!
    @IBOutlet weak var resultPingLabel: UILabel!
    @IBOutlet weak var resultJitterLabel: UILabel!
    @IBOutlet weak var resultLossLabel: UILabel!

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
    private var startButtonPressedAnimations: AnimationContainer!
    private var speedTestFinishedAnimations: AnimationContainer!
    private var backButtonPressedAnimations: AnimationContainer!
    private var downloadTestStartedAnimations: AnimationContainer!
    private var uploadTestStartedAnimations: AnimationContainer!
    private var connection: Connection = NetworkConnection()

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
        downloadTestStartedAnimations = getDownloadTestStartedAnimations()
        uploadTestStartedAnimations = getUploadTestStartedAnimations()
    }

    private func getStartButtonAnimations() -> AnimationContainer {
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

        animations.append(MetricsLiveShowAnimation(view: metricsLiveView))

        animations.append(TransferSpeedDownAnimation(verticalConstraint: speedResultVerticalConstraint))
        return AnimationContainer(animations: animations)
    }

    private func getSpeedTestFinishedAnimations()  -> AnimationContainer{
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
        animations.append(MetricsLiveHideAnimation(view: metricsLiveView))

        animations.append(TransferSpeedUpAnimation(
                            transferSpeedView: transferSpeedView,
                            verticalConstraint: speedResultVerticalConstraint))

        animations.append(MetricsResultsShowAnimation(view: metricsResultsView))
        return AnimationContainer(animations: animations)
    }

    private func getBackButtonPressedAnimations() -> AnimationContainer {
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

        animations.append(MetricsResultsHideAnimation(view: metricsResultsView))
        animations.append(ResetTransferSpeedsAnimation(upload: uploadSpeedLabel, download: downloadSpeedLabel))
        return AnimationContainer(animations: animations)
    }

    private func getDownloadTestStartedAnimations() -> AnimationContainer {
        var animations = [Animation]()
        animations.append(DownloadTransferSpeedAnimation(
                            networkConnection: connection,
                            currentLabel: transferSpeedLabel,
                            finalLabel: downloadSpeedLabel))

        let live = Metrics(ping: livePingLabel, jitter: liveJitterLabel, loss: liveLossLabel)
        animations.append(MetricsLiveDownloadAnimation(connection: connection, liveMetrics: live))
        animations.append(ShowDownloadAnimation(image: transferImage))
        animations.append(DownloadAnimation(forView: speedTestView))

        return AnimationContainer(animations: animations)
    }

    private func getUploadTestStartedAnimations() -> AnimationContainer {
        var animations = [Animation]()
        animations.append(UploadTransferSpeedAnimation(
                            networkConnection: connection,
                            currentLabel: transferSpeedLabel,
                            finalLabel: uploadSpeedLabel))
        let live = Metrics(ping: livePingLabel, jitter: liveJitterLabel, loss: liveLossLabel)
        let result = Metrics(ping: resultPingLabel, jitter: resultJitterLabel, loss: resultLossLabel)
        animations.append(MetricsLiveUploadAnimation(connection: connection, liveMetrics: live, resultMetrics: result))
        animations.append(ShowUploadAnimation(image: transferImage))
        animations.append(UploadAnimation(forView: speedTestView))
        return AnimationContainer(animations: animations)
    }

    // MARK: - Start Button Pressed

    @IBAction func startButtonPressed(_ sender: Any) {
        showDownloadAnimation()
        startButtonPressedAnimations.start()
    }

    private func showDownloadAnimation() {
        downloadTestStartedAnimations.start()
        downloadAnimationCompleted()
    }

    private func downloadAnimationCompleted() {
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            self.uploadTestAnimationCompleted()
            self.downloadTestStartedAnimations.finish()
        }
    }

    private func uploadTestAnimationCompleted() {
        uploadTestStartedAnimations.start()
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            self.speedTestFinishedAnimations.start()
            self.transferImage.isHidden = true
            self.uploadTestStartedAnimations.finish()
        }
    }

    func getDuration() -> DispatchTime {
        return .now() + .milliseconds(speedTestDurationInSeconds * 1000)
    }

    // MARK: - Back Button Pressed
    @IBAction func backButtonPressed(_ sender: Any) {
        backButtonPressedAnimations.start()
    }
}

