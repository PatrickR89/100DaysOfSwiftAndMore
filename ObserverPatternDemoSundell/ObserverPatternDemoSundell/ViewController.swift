//
//  ViewController.swift
//  ObserverPatternDemoSundell
//
//  Created by Patrick on 18.08.2022..
//

import UIKit

class NowPlayingViewController: UIViewController {

    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()

        notificationCenter.addObserver(self, selector: #selector(playbackDidStart), name: .playbackStarted, object: nil)
    }


}

