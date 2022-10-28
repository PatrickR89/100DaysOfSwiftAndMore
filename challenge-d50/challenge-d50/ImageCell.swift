//
//  ImageCell.swift
//  challenge-d50
//
//  Created by Patrick on 12.07.2022..
//

import UIKit

class ImageCell: UITableViewCell {

    var cellImageView = UIImageView()
    var captionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .white

        configImageView()
        configCaptionLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ImageCell {
    func configImageView() {
        contentView.addSubview(cellImageView)

        cellImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            cellImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    func configCaptionLabel() {
        contentView.addSubview(captionLabel)

        captionLabel.translatesAutoresizingMaskIntoConstraints = false

        captionLabel.text = ""

        NSLayoutConstraint.activate([
            captionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            captionLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 30)
        ])
    }

    func setupCell(image: ImageData) {
        captionLabel.text = image.caption
            let path = FileManager.default.getFilePath(image.image)
            cellImageView.image = UIImage(contentsOfFile: path.path)
        }
}
