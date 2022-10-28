//
//  EditNoteViewController.swift
//  challenge-d74
//
//  Created by Patrick on 22.08.2022..
//

import UIKit

class EditNoteViewController: UIViewController {

    let noteView: NoteView
    let viewModel: NoteViewModel

    init(note: Note, index: Int) {
        self.noteView = NoteView(title: note.title, content: note.content, buttonTitle: "EDIT")
        self.viewModel = NoteViewModel(note: note, newNote: false, index: index)
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeSelf))
    }
}

private extension EditNoteViewController {
    @objc func closeSelf() {
        self.dismiss(animated: true)
    }

    func setupBindings() {
        viewModel.isButtonEnabled.bind { [weak self] isEnabled in
            guard let isEnabled  = isEnabled else {return}
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

extension EditNoteViewController: NoteViewDelegate {
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
