//
//  MemeViewModel.swift
//  challenge-d90
//
//  Created by Patrick on 31.08.2022..
//

import UIKit

class MemeViewModel {

    private var meme: Meme = Meme(image: "", topText: false, bottomText: false) {
        didSet {
            valueDidChange()
            updateMemeVCNavigation(key: meme.image)
        }
    }

    func deleteMeme() {
        delegate?.memeViewModel(self, didDeleteMeme: meme)
    }

    func updateMeme(meme: Meme) {
        self.meme = meme
        delegate?.memeViewModel(self, didChangeMeme: meme)
        valueDidChange()
    }

    func loadMeme(meme: Meme?) {
        if let meme = meme {
            self.meme = meme
        } else {
            self.meme = Meme(image: "", topText: false, bottomText: false)
        }
    }

    func returnMeme() -> Meme? {
        return meme
    }

    weak var delegate: MemeViewModelDelegate?

    private var observer: ((UIImage) -> Void)?

    private func valueDidChange() {
        let path = FileManager.default.getFilePath(meme.image)
        guard let observer = self.observer,
        let image = UIImage(contentsOfFile: path.path) else {return}
        observer( image )
    }

    private func updateMemeVCNavigation(key: String) {
        let value = key != ""
        delegate?.memeViewModel(self, didLoadMeme: value)
    }
}

extension MemeViewModel {
    func observeImage(_ closure: @escaping (UIImage) -> Void) {
        self.observer = closure
        valueDidChange()
    }
}
