//
//  SpeedTestViewController.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-17.
//

import SpriteKit
import UIKit

class SpeedTestViewController: UIViewController {

    @IBOutlet weak var speedTestView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startButtonSKView: SKView!
    @IBOutlet weak var startButtonGlowView: UIImageView!
    private var displayDurationInSeconds = 1
    private var hideStartButtonAnimationTimer: Timer?

    private var scene: SKScene?

    override func viewWillAppear(_ animated: Bool) {
        view.setGradientBackground()
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.startButtonSKView {
            if let scene = SKScene(fileNamed: "StartButton") {
                view.presentScene(scene)
                scene.backgroundColor = .clear
                self.scene = scene
            }
        }
    }

    fileprivate func showStartButton() {
        startButton.isHidden = false
    }

    @IBAction func startButtonPressed(_fsender: Any) {
        showDownloadAnimation()

        hideStartButtonTitle()
        startStartButtonAnimation()
        hideStartButtonAnimation()
    }

    fileprivate func hideStartButtonTitle() {
        startButton.isHidden = true
    }

    fileprivate func startStartButtonAnimation() {
        let action = SKAction.animate(with: getTextures(), timePerFrame: 0.04)
        let animation = SKSpriteNode(imageNamed: "1.png")
        animation.run(action)
        scene?.addChild(animation)
    }

    func getTextures() -> [SKTexture] {
        var result = [SKTexture]()
        for i in 1...7 {
            result.append(SKTexture(imageNamed: "\(i).png"))
        }
        return result
    }

    fileprivate func hideStartButtonAnimation() {
        hideStartButtonAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
            self.startButtonSKView.alpha -= 0.1
            if self.startButtonSKView.alpha <= 0 {
                timer.invalidate()
                self.startButtonGlowView.isHidden = true
            }
        }
    }

    fileprivate func showDownloadAnimation() {
        let downloadAnimation = DownloadAnimation(forView: self.speedTestView)
        downloadAnimation.display()
        downloadAnimationCompleted(downloadAnimation)
    }

    fileprivate func downloadAnimationCompleted(_ downloadAnimation: DownloadAnimation) {
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            downloadAnimation.remove()
            let uploadAnimation = UploadAnimation(forView: self.speedTestView)
            uploadAnimation.display()
            self.uploadAnimationCompleted(uploadAnimation)
        }
    }

    fileprivate func uploadAnimationCompleted(_ uploadAnimation: UploadAnimation) {
        DispatchQueue.main.asyncAfter(deadline: getDuration()) {
            uploadAnimation.remove()
            self.showSummaryViewController()
        }
    }

    private func getDuration() -> DispatchTime {
        return .now() + .milliseconds(displayDurationInSeconds * 1000)
    }

    func showSummaryViewController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let summaryViewController = storyBoard.instantiateViewController(withIdentifier: "summaryViewController")
        present(summaryViewController, animated: true, completion: reset)
    }

    func reset() {
        startButtonSKView.alpha = 1
        showStartButton()
    }
}

