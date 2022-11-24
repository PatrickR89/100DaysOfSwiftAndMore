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
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()

    private let posterImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
            posterImageVIew.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            posterImageVIew.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            posterImageVIew.widthAnchor.constraint(equalToConstant: 100)
        ]

        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: posterImageVIew.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]

        let playButtonConstraints = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(posterImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)
    }

    public func configure(with model: MovieViewModel) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)")
        posterImageVIew.sd_setImage(with: url)
        titleLabel.text = model.titleName
    }
}
