//
//  SummaryViewController.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-18.
//

import UIKit

class SummaryViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        view.setGradientBackground()
        super.viewWillAppear(animated)
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
