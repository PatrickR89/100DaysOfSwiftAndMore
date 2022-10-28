//
//  MemeViewModel.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

class MemesViewModel {
    
    private var memes = [Meme](DataStorage.shared.loadFile()) {
        didSet {
            valueDidChange()
        }
    }

    let memeViewModel = MemeViewModel()
    let memeVCViewModel = MemeVCViewModel()

    private var observer: (([Meme]) -> Void)?

    init() {
        memeViewModel.delegate = self
    }

    private func valueDidChange() {
        guard let observer = self.observer else {return}
        observer(memes)
    }

    private func findMeme(meme: Meme) -> Int? {
        return memes.firstIndex(where: {$0.image == meme.image})
    }

    func returnMemesCount() -> Int {
        return memes.count
    }

    func findMemeByIndex(at index: Int) -> Meme {
        return memes[index]
    }
}

extension MemesViewModel {
    func observeMemesState(_ closure: @escaping ([Meme]) -> Void) {
        self.observer = closure
        valueDidChange()
    }

    func loadMeme(meme: Meme?) {
        memeViewModel.loadMeme(meme: meme)
    }

    
}

extension MemesViewModel: MemeViewModelDelegate {
    func memeViewModel(_ viewModel: MemeViewModel, didChangeMeme meme: Meme) {
        if let index = findMeme(meme: meme) {
            memes[index] = meme
        } else {
            memes.append(meme)
        }
    }

    func memeViewModel(_ viewModel: MemeViewModel, didDeleteMeme meme: Meme) {
        if let index = findMeme(meme: meme) {
            memes.remove(at: index)
        }
    }

    func memeViewModel(_ viewModel: MemeViewModel, didLoadMeme: Bool) {
        memeVCViewModel.updateIsImageLoaded(didLoadMeme)
    }
}
