//
//  MemesCollectionView.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

class MemesCollectionView: UIView {

    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.estimatedItemSize.width = 180
        collectionLayout.estimatedItemSize.height = 180
        return collectionLayout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        return collectionView
    }()

    weak var delegate: MemesCollectionViewDelegate?

    var viewModel: MemesViewModel

    init(with viewModel: MemesViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        setupBindings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MemesCollectionView {
    func setupUI() {
        collectionView.register(MemeViewCell.self, forCellWithReuseIdentifier: "MemeCell")
        self.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                   collectionView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
                   collectionView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
                   collectionView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor),
                   collectionView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor)
               ])
    }

    func setupBindings() {
        viewModel.observeMemesState { memes in
            DispatchQueue.main.async { [weak self] in
                
                self?.collectionView.reloadData()
                DataStorage.shared.saveFile(save: memes)
            }
        }
    }
}

extension MemesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.returnMemesCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as? MemeViewCell else {fatalError("Cell not found")}
        cell.recieveMeme(viewModel.findMemeByIndex(at: indexPath.item))
        return cell
    }
}

extension MemesCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        delegate?.memesCollectionView(self, didSelectCellWith: viewModel.findMemeByIndex(at: index), at: index)
    }
}
