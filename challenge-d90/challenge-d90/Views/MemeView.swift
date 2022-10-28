//
//  MemeView.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

class MemeView: UIView {

    var imageView = UIImageView()
    var viewModel: MemeViewModel
    weak var delegate: MemeViewDelegate?

    init(with viewModel: MemeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        setupBindings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MemeView {
    func setupBindings() {
        viewModel.observeImage { currentImage in
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = currentImage
            }
        }
    }

    func setupUI() {
        self.addSubview(imageView)
        self.backgroundColor = .black
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(imageTapped))

        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100)
        ])
    }

    @objc func imageTapped() {
        delegate?.memeViewDidTapImage()
    }
}
