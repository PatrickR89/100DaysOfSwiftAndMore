//
//  MovieTableViewCell.swift
//  NetflixClone
//
//  Created by Patrick on 18.11.2022..
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let posterImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageVIew)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)

        applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func applyConstraints() {
        let posterImageViewConstraints = [
            posterImageVIew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageVIew.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageVIew.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImageVIew.widthAnchor.constraint(equalToConstant: 100)
        ]

        NSLayoutConstraint.activate(posterImageViewConstraints)
    }

    public func configure(with model: MoviewViewModel) {
        guard let url = URL(string: model.posterURL) else {return}
        posterImageVIew.sd_setImage(with: url)
        titleLabel.text = model.movieName
    }

}
