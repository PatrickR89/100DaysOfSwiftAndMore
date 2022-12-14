//
//  NoteTableViewCell.swift
//  challenge-d74
//
//  Created by Patrick on 19.08.2022..
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    var titleView = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoteTableViewCell {
    func setupCell(_ title: String) {
        titleView.text = title
    }
}

private extension NoteTableViewCell {
    func setupUI() {
        addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = UIFont.systemFont(ofSize: 25)

        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
