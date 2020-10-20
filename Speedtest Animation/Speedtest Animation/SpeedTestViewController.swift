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
    private var speedtestDurationInSeconds = 3
    @IBOutlet weak var speedTestValuesView: UIView!
    @IBOutlet weak var transferImage: UIImageView!

    // MARK: - Server
    @IBOutlet weak var serverTitle: UILabel!
    @IBOutlet weak var serverSubtitle: UILabel!
    @IBOutlet weak var serverButton: UIButton!
    @IBOutlet weak var serverImageVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var serverImageHorizontalConstraint: NSLayoutConstraint!
    private var serverImageVerticalDefault: CGFloat!
    private var serverImageHorizontalDefault: CGFloat!

    // MARK: - WIFI
    @IBOutlet weak var wifiTitle: UILabel!
    @IBOutlet weak var wifiImageVerticalConstraint: NSLayoutConstraint!
    private var wifiImageVerticalDefault: CGFloat!

    // MARK: - Start Button
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startButtonSKView: SKView!
    @IBOutlet weak var startButtonGlowView: UIImageView!
    private var startButtonScene: SKScene!

    // MARK: - Dots
    @IBOutlet weak var dotsImage: UIImageView!

    // MARK: - Speed Result
    @IBOutlet weak var speedResultVerticalConstraint: NSLayoutConstraint!
    private var speedResultVerticalDefault: CGFloat!

    private var viewsAnimationTimer: Timer?

    // MARK: - Setup
    override func viewWillAppear(_ animated: Bool) {
        view.setGradientBackground()
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        constraintSetup()
        createStartButtonAnimationScene()
    }

    private func constraintSetup() {
        serverImageVerticalDefault = serverImageVerticalConstraint.constant
        serverImageHorizontalDefault = serverImageHorizontalConstraint.constant
        wifiImageVerticalDefault = wifiImageVerticalConstraint.constant
        speedResultVerticalDefault = speedResultVerticalConstraint.constant
    }

    private func createStartButtonAnimationScene() {
        if let view = self.startButtonSKView,
           let scene = SKScene(fileNamed: "StartButton") {
            view.presentScene(scene)
            scene.backgroundColor = .clear
            startButtonScene = scene
        }
    }

    // MARK: - Start Button Pressed

    @IBAction func startButtonPressed(_fsender: Any) {
        showDownloadAnimation()
        hideStartButtonTitle()
        startStartButtonAnimation()
        hideStartButtonAnimation()
        showDotsImages()
        showSpeedTestValues()
        showDownloadImage()
    }

    private func hideStartButtonTitle() {
        startButton.isHidden = true
    }

    private func startStartButtonAnimation() {
        let action = SKAction.animate(with: getTextures(), timePerFrame: 0.04)
        let animation = SKSpriteNode(imageNamed: "1.png")
        animation.run(action)
        startButtonScene?.addChild(animation)
    }

    private func getTextures() -> [SKTexture] {
        var result = [SKTexture]()
        for i in 1...7 {
            result.append(SKTexture(imageNamed: "\(i).png"))
        }
        return result
    }

    private func hideStartButtonAnimation() {
        viewsAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
            self.animateServerViews()
            self.animateWifiViews()
            self.animateStartViews()
            self.animateDotsImages()
            self.animateSpeedResultViews()
            self.animateSpeedTestValues()
            if self.startButtonSKView.alpha <= 0 {
                timer.invalidate()
            }
        }
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

    private func animateServerViews() {
        serverTitle.alpha -= 0.1
        serverSubtitle.alpha -= 0.1
        serverButton.alpha -= 0.1
        serverImageVerticalConstraint.constant -= 12.5
        serverImageHorizontalConstraint.constant += 10
    }

    private func animateWifiViews() {
        wifiTitle.alpha -= 0.1
        wifiImageVerticalConstraint.constant -= 19
    }

    private func animateStartViews() {
        startButtonSKView.alpha -= 0.1
        startButtonGlowView.alpha -= 0.1
    }

    private func animateDotsImages() {
        dotsImage.alpha += 0.1
    }

    private func animateSpeedResultViews() {
        speedResultVerticalConstraint.constant -= 15
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
            self.showSummaryViewController()
        }
    }

    private func getDuration() -> DispatchTime {
        return .now() + .milliseconds(speedtestDurationInSeconds * 1000)
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
        wifiImageVerticalConstraint.constant = wifiImageVerticalDefault
        serverImageVerticalConstraint.constant = serverImageVerticalDefault
        serverImageHorizontalConstraint.constant = serverImageHorizontalDefault
        speedResultVerticalConstraint.constant = speedResultVerticalDefault
    }

    private func resetSpeedTestValues() {
        speedTestValuesView.isHidden = true
        speedTestValuesView.alpha = 1
    }

    private func resetTransferImage() {
        transferImage.isHidden = true
    }

}

