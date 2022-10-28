//
//  MemeViewModelDelegate.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

protocol MemeViewModelDelegate: AnyObject {
    func memeViewModel(_ viewModel: MemeViewModel, didChangeMeme meme: Meme)
    func memeViewModel(_ viewModel: MemeViewModel, didDeleteMeme meme: Meme)
    func memeViewModel(_ viewModel: MemeViewModel, didLoadMeme: Bool)
}
