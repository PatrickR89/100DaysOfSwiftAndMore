//
//  MemesCollectionViewController.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

class MemesCollectionViewController: UIViewController {

    var memesViewModel = MemesViewModel()
    var memesCollectionView: MemesCollectionView

    init() {
        self.memesCollectionView = MemesCollectionView(with: memesViewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMeme))
    }



    func setupUI() {
        view.addSubview(memesCollectionView)
        memesCollectionView.delegate = self
        memesCollectionView.frame = view.bounds
    }

    @objc func addMeme() {
        memesViewModel.loadMeme(meme: nil)
        let viewController = MemeViewController( memeViewModel: memesViewModel.memeViewModel, with: memesViewModel.memeVCViewModel)
        let navController = UINavigationController()

        navController.viewControllers = [viewController]
        present(navController, animated: true)
    }
}

extension MemesCollectionViewController: MemesCollectionViewDelegate {
    func memesCollectionView(_ view: MemesCollectionView, didSelectCellWith meme: Meme, at index: Int) {
        memesViewModel.loadMeme(meme: meme)
        let viewController = MemeViewController( memeViewModel: memesViewModel.memeViewModel, with: memesViewModel.memeVCViewModel)
        let navController = UINavigationController()

        navController.viewControllers = [viewController]
        present(navController, animated: true)
    }
}
