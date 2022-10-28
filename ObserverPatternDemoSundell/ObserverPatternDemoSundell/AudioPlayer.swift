//
//  AudioPlayer.swift
//  ObserverPatternDemoSundell
//
//  Created by Patrick on 18.08.2022..
//

import Foundation

class AudioPlayer {
    private var state = State.idle {
        didSet {
            stateDidChange()
        }
    }

    var item = Item(name: "some song", duration: 3.5)
// notification center as observer
    private let notificationCenter: NotificationCenter

    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
    }

    func play(_ item: Item) {
        state = .playing(item)
//        startPlayback(with: item)
    }

    func pause() {
        switch state {
        case .idle, .paused:
            break
        case .playing(let item):
            state = .paused(item)
//            pausePlayback()
        }
    }

    func stop() {
        state = .idle
//        stopPlayback()
    }
}

private extension AudioPlayer {
    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
}

private extension AudioPlayer {
    func stateDidChange() {
        switch state {
        case .idle:
            notificationCenter.post(name: .playbackStopped, object: nil)
        case .paused(let item):
            notificationCenter.post(name: .playbackPaused, object: item)
        case .playing(let item):
            notificationCenter.post(name: .playbackStarted, object: item)
        }
    }
}
