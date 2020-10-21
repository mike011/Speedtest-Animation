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
    @IBOutlet weak var transferSpeedLabel: UILabel!
    @IBOutlet weak var transferSpeedUnitsLabel: UILabel!
    @IBOutlet weak var downloadSpeedLabel: UILabel!
    @IBOutlet weak var uploadSpeedLabel: UILabel!

    // MARK: - Server
    @IBOutlet weak var serverTitle: UILabel!
    @IBOutlet weak var serverSubtitle: UILabel!
    @IBOutlet weak var serverButton: UIButton!
    @IBOutlet weak var serverImageVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var serverImageHorizontalConstraint: NSLayoutConstraint!

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
    private var speedResultVerticalDefault: CGFloat!

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
        constraintSetup()
    }

    private func getStartButtonAnimations() -> [Animation] {
        var animations = [Animation]()
        animations.append(StartButtonAnimation(view: startButtonSKView, button: startButton))
        let serverArgs = ServerArgs(title: serverTitle,
                                    subtitle: serverSubtitle,
                                    button: serverButton,
                                    imageVerticalConstraint: serverImageVerticalConstraint,
                                    imageHorizontalConstraint: serverImageHorizontalConstraint)
        //startButonPressedAnimations.append(ServerForwardAnimation(args: serverArgs))

        animations.append(StartButtonHideBackgroundAnimation(sKView: startButtonSKView, glowView: startButtonGlowView))

        let wifiArgs = WifiArgs(title: wifiTitle, imageVerticalConstraint: wifiImageVerticalConstraint)
        animations.append(WifiImageDownAnimation(args: wifiArgs))

        return animations
    }

    private func getSpeedTestFinishedAnimations()  -> [Animation] {
        var animations = [Animation]()
        let serverArgs = ServerArgs(title: serverTitle,
                                    subtitle: serverSubtitle,
                                    button: serverButton,
                                    imageVerticalConstraint: serverImageVerticalConstraint,
                                    imageHorizontalConstraint: serverImageHorizontalConstraint)
        //animations.append(ServerBackwardAnimation(args: serverArgs))

        animations.append(WifiImageLeftAndTextDownAnimation(
                            title: wifiTitle,
                            subtitle: wifiSubtitle,
                            imageVerticalConstraint: wifiImageVerticalConstraint,
                            imageHorizontalConstraint: wifiImageHorizontalConstraint,
                            textVerticalConstraint: wifiTitleVerticalConstraint))

//        animations.append(WifiTextDownAnimation(title: wifiTitle, verticalConstraint: wifiTitleVerticalConstraint))

        animations.append(SpeedTestCompleteShowButtonsAnimation(view: speedTestFinishedButtons))
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
        animations.append(SpeedTestCompleteHideButtonsAnimation(view: speedTestFinishedButtons))

        animations.append(StartButtonShowBackgroundAnimation(
                            sKView: startButtonSKView,
                            glowView: startButtonGlowView,
                            button: startButton))
        return animations

    }


    private func constraintSetup() {
        speedResultVerticalDefault = speedResultVerticalConstraint.constant
    }

    // MARK: - Start Button Pressed

    @IBAction func startButtonPressed(_ sender: Any) {
        showDownloadAnimation()
        //hideStartButtonTitle()

//        startStartButtonAnimation()
        startViewsAnimationTimer()
//        showDotsImages()
//        showSpeedTestValues()
//        showDownloadImage()
    }

    private func hideStartButtonTitle() {
        startButton.isHidden = true
    }

    private func getTextures() -> [SKTexture] {
        var result = [SKTexture]()
        for i in 1...7 {
            result.append(SKTexture(imageNamed: "\(i).png"))
        }
        return result
    }

    private func startViewsAnimationTimer() {
        for animation in startButtonPressedAnimations {
            animation.start()
        }
//        viewsAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
//            self.speedTestStartAnimation()
//            if self.startButtonSKView.alpha <= 0 {
//                timer.invalidate()
//            }
//        }
//
//        valuesAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { timer in
//            self.animateSpeedValuesViews()
//        }
    }

    fileprivate func speedTestStartAnimation() {
        animateStartViews()
        animateDotsImages()
        animateSpeedResultViews()
        animateSpeedTestValues()
    }

    private func showDotsImages() {
        dotsImage.isHidden = false
        dotsImage.alpha = 0
    }

    private func showSpeedTestValues() {
        speedTestValuesView.isHidden = false
        speedTestValuesView.alpha = 0
    }

    private func showDownloadImage() {
        transferImage.isHidden = false
    }

    private func animateStartViews() {
//        startButtonSKView.alpha -= 0.1
//        startButtonGlowView.alpha -= 0.1
    }

    private func animateDotsImages() {
        dotsImage.alpha += 0.1
    }

    private func animateSpeedResultViews() {
        speedResultVerticalConstraint.constant -= 15
    }

    private func animateSpeedValuesViews() {
        transferSpeedLabel.text = "\(getCurrentSpeed())"
    }

    private func getCurrentSpeed() -> String {
        let value = Float.random(in: 90..<250)
        return String(format: "%.2f", value);
    }

    private func animateSpeedTestValues() {
        speedTestValuesView.alpha += 0.2
    }
    
    private func showDownloadAnimation() {
        let downloadAnimation = DownloadAnimation(forView: self.speedTestView)
        downloadAnimation.display()
        downloadAnimationCompleted(downloadAnimation)
    }

    private func downloadAnimationCompleted(_ downloadAnimation: DownloadAnimation) {
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            self.downloadSpeedLabel.text = self.transferSpeedLabel.text
            self.transferImage.image = UIImage(named: "upload")!
            downloadAnimation.remove()
            let uploadAnimation = UploadAnimation(forView: self.speedTestView)
            uploadAnimation.display()
            self.uploadAnimationCompleted(uploadAnimation)
        }
    }

    private func uploadAnimationCompleted(_ uploadAnimation: UploadAnimation) {
        adjustConstraints()
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            uploadAnimation.remove()
            //self.uploadSpeedLabel.text = self.transferSpeedLabel.text
            //self.valuesAnimationTimer?.invalidate()
            self.animateResultViewShown()
        }
    }

    private func adjustConstraints() {
        wifiTitleVerticalConstraint.constant = 150
        wifiTitleHorizontalConstraint.constant = 68
    }

    private func animateResultViewShown() {
        for animation in speedTestFinishedAnimations {
            animation.start()
        }
//        viewsAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
//            self.speedTestEndAnimation()
//            if self.server.isFinished() {
//                timer.invalidate()
//            }
//        }
    }

    fileprivate func speedTestEndAnimation() {
        //server.animationAtEndOfSpeedTest()
        //wifi.animationAtEndOfSpeedTest()
        //animateWifiViews()
        animateDotsImages()
        animateSpeedResultViews()
        animateSpeedTestValues()
        transferImage.isHidden = true
        transferSpeedLabel.isHidden = true
        transferSpeedUnitsLabel.isHidden = true
        speedTestValuesView.isHidden = true
    }

    private func getDuration() -> DispatchTime {
        return .now() + .milliseconds(speedTestDurationInSeconds * 1000)
    }

    private func showSummaryViewController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let summaryViewController = storyBoard.instantiateViewController(withIdentifier: "summaryViewController")
        present(summaryViewController, animated: true, completion: reset)
    }

    // MARK: - Clean Up

    private func reset() {
        resetStartViews()
        resetWifiViews()
        resetServerViews()
        resetDotsImages()
        resetConstraints()
        resetSpeedTestValues()
        resetTransferImage()
        valuesAnimationTimer?.invalidate()
    }

    private func resetStartViews() {
        startButton.isHidden = false
        startButtonSKView.alpha = 1
        startButtonGlowView.alpha = 1
    }

    private func resetWifiViews() {
        wifiTitle.alpha = 1

    }

    private func resetServerViews() {
        serverTitle.alpha = 1
        serverSubtitle.alpha = 1
        serverButton.alpha = 1
    }

    private func resetDotsImages() {
        dotsImage.isHidden = true
        dotsImage.alpha = 1
    }

    private func resetConstraints() {
        //wifiImageVerticalConstraint.constant = wifiImageVerticalDefault
       // serverImageVerticalConstraint.constant = serverImageVerticalDefault
        //serverImageHorizontalConstraint.constant = serverImageHorizontalDefault
        speedResultVerticalConstraint.constant = speedResultVerticalDefault
    }

    private func resetSpeedTestValues() {
        speedTestValuesView.isHidden = true
        speedTestValuesView.alpha = 1
        transferSpeedLabel.text = "-"
    }

    private func resetTransferImage() {
        transferImage.isHidden = true
        transferImage.image = UIImage(named: "download")!
    }

    // MARK: - Back Button Pressed
    @IBAction func backButtonPressed(_ sender: Any) {
        for animation in backButtonPressedAnimations {
            animation.start()
        }
    }
}

