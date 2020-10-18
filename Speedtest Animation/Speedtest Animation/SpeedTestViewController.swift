//
//  SpeedTestViewController.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-17.
//

import UIKit

class SpeedTestViewController: UIViewController {

    @IBOutlet weak var speedTestView: UIView!
    private var displayDurationInSeconds = 3

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }

    func setGradientBackground() {
        let colorTop =  UIColor(named: "LightBackgroundColor")!.cgColor
        let colorBottom = UIColor(named: "DarkBackgroundColor")!.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonPressed(_fsender: Any) {

        let downloadAnimation = DownloadAnimation(forView: self.speedTestView)
        downloadAnimation.display()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(displayDurationInSeconds * 1000)) {
            downloadAnimation.remove()
            let uploadAnimation = UploadAnimation(forView: self.speedTestView)
            uploadAnimation.display()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(self.displayDurationInSeconds * 1000)) {
                uploadAnimation.remove()
            }
        }
    }
}

