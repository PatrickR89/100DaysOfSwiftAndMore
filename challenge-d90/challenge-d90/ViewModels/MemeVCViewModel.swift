//
//  MemeVCViewModel.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

class MemeVCViewModel {

    private var isImageLoaded: Bool = false {
        didSet {
            valueDidChange()
        }
    }

    private var observer: ((Bool) -> Void)?

    private func valueDidChange() {
        guard let observer = self.observer else {return}
        observer( isImageLoaded )
    }
}

extension MemeVCViewModel {
    func observeImageState(_ closure: @escaping (Bool) -> Void) {
        self.observer = closure
        valueDidChange()
    }

    func updateIsImageLoaded(_ isImageLoaded: Bool) {
        self.isImageLoaded = isImageLoaded
    }
}
