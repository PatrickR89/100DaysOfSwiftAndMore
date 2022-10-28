//
//  MemesViewDelegate.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

protocol MemesCollectionViewDelegate: AnyObject {
    func memesCollectionView(_ view: MemesCollectionView, didSelectCellWith meme: Meme, at index: Int)
}
