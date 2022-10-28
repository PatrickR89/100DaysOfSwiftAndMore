//
//  Notification+extension.swift
//  ObserverPatternDemoSundell
//
//  Created by Patrick on 18.08.2022..
//

import UIKit

extension Notification.Name {
    static var playbackStarted: Notification.Name {
        return .init(rawValue: "AudioPlayer.playbackStarted")
    }

    static var playbackPaused: Notification.Name {
        return .init(rawValue: "AudioPlayer.playbackPaused")
    }

    static var playbackStopped: Notification.Name {
        return .init(rawValue: "AudioPlayer.playbackPaused")
    }
}
