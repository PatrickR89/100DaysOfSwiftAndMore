//
//  NoteView.swift
//  challenge-d74
//
//  Created by Patrick on 22.08.2022..
//

import UIKit

class NoteView: UIView {
    var noteTitleView = UITextField()
    var noteContentView = UITextView()
    var addButton = UIButton()

    weak var delegate: NoteViewDelegate?

    init(title: String, content: String, buttonTitle: String) {
        self.noteTitleView.text = title
        self.noteContentView.text = content
        self.addButton.setTitle(buttonTitle, for: .normal)
        super.init(frame: .zero)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.addSubview(noteTitleView)
        self.addSubview(noteContentView)
        self.addSubview(addButton)

        noteTitleView.translatesAutoresizingMaskIntoConstraints = false
        noteContentView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false

        noteTitleView.font = UIFont.systemFont(ofSize: 30)
        noteContentView.font = UIFont.systemFont(ofSize: 20)

        noteTitleView.layer.borderColor = UIColor.gray.cgColor
        noteTitleView.layer.borderWidth = 1
        noteContentView.layer.borderColor = UIColor.gray.cgColor
        noteContentView.layer.borderWidth = 1

        noteTitleView.delegate = self
        noteContentView.delegate = self

        addButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            noteTitleView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            noteTitleView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            noteTitleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            noteContentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            noteContentView.topAnchor.constraint(equalTo: noteTitleView.bottomAnchor, constant: 15),
            noteContentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            noteContentView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),
            addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: noteContentView.bottomAnchor, constant: 30),
            addButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7)
        ])
    }

    @objc func clickButton() {
        delegate?.buttonClicked()
    }
}

extension NoteView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        delegate?.titleUpdated(title: text)
    }
}

extension NoteView: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.contentUpdated(content: textView.text)
    }
}
