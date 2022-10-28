//
//  NoteViewModel.swift
//  challenge-d74
//
//  Created by Patrick on 19.08.2022..
//

import UIKit

class NoteViewModel {
    
    var note: Note? {
        didSet {
            if let note = note {
                if newNote {
                    NoteViewModel.delegate?.noteDidSet(note: note)
                } else {
                    NoteViewModel.delegate?.noteDidChange(note: note, index: index)
                }
            }

        }
    }

    var newNote: Bool
    var index: Int
    var isButtonEnabled: Observable<Bool> = Observable(false)

    static weak var delegate: NewNoteViewModelDelegate?

    var noteTitle: String? = nil {
        didSet {
            isButtonEnabled.value = enableButton()}
    }

    var noteContent: String? = nil {
        didSet {isButtonEnabled.value = enableButton()}
    }

    init(note: Note, newNote: Bool, index: Int) {
        self.note = note
        self.newNote = newNote
        self.index = index
    }

    func applyNoteChanges() {
        guard let noteTitle = noteTitle,
              let noteContent = noteContent else {
            return
        }

        note = Note(title: noteTitle, content: noteContent)
    }

}

private extension NoteViewModel {
    func enableButton() -> Bool {
        guard let noteTitle = noteTitle,
              let noteContent = noteContent else {
            return false
        }
        return noteTitle.count >= 1 && noteContent.count >= 1
    }
}
