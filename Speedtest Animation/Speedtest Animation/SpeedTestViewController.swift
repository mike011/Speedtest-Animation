//
//  SpeedTestViewController.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-17.
//

import UIKit

class SpeedTestViewController: UIViewController {

    @IBOutlet weak var speedTestView: UIView!
    private var displayDurationInSeconds = 1

    override func viewWillAppear(_ animated: Bool) {
        view.setGradientBackground()
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonPressed(_fsender: Any) {
        showDownloadAnimation()
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
        present(summaryViewController, animated: true, completion: nil)
    }
}

