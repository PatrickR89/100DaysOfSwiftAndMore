//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by Patrick on 17.11.2022..
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {

    static let identifier = "TitleCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.frame = contentView.bounds
    }

    public func configure(with model: String?) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model ?? "")")
        imageView.sd_setImage(with: url)
    }
}
