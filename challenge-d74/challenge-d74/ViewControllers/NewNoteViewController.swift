//
//  NoteViewController.swift
//  challenge-d74
//
//  Created by Patrick on 19.08.2022..
//

import UIKit

class NewNoteViewController: UIViewController {

    let noteView = NoteView(title: "", content: "", buttonTitle: "ADD")
    let viewModel = NoteViewModel(note: Note(title: "", content: ""), newNote: true, index: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeSelf))
    }
}

private extension NewNoteViewController {
    @objc func closeSelf() {
        self.dismiss(animated: true)
    }

    func setupBindings() {
        viewModel.isButtonEnabled.bind { [weak self] isEnabled in
            guard let isEnabled = isEnabled else {return}
            if isEnabled {
                self?.noteView.addButton.backgroundColor = .systemBlue
            } else {
                self?.noteView.addButton.backgroundColor = .lightGray
            }
            self?.noteView.addButton.isEnabled = isEnabled
        }
    }
    func setupUI() {
        view.addSubview(noteView)
        noteView.delegate = self
        noteView.frame = view.bounds
    }
}

extension NewNoteViewController: NoteViewDelegate {
    func titleUpdated(title: String) {
        viewModel.noteTitle = title
    }

    func contentUpdated(content: String) {
        viewModel.noteContent = content
    }

    func buttonClicked() {
        viewModel.applyNoteChanges()
        self.dismiss(animated: true)
    }
}
