//
//  NotesViewModel.swift
//  challenge-d74
//
//  Created by Patrick on 22.08.2022..
//

import UIKit

class NotesViewModel {
    
    var notes: Observable<[Note]> = Observable(DataStorageManipulation.shared.loadAndDecode())

    var tempNotes: [Note] = [] {
        didSet {
            notes.value = tempNotes
        }
    }

    init() {
        NoteViewModel.delegate = self
    }

    func deleteNote(index: Int) {
        notes.value?.remove(at: index)
    }
}

extension NotesViewModel: NewNoteViewModelDelegate {
    func noteDidChange(note: Note, index: Int) {
        notes.value?[index] = note
    }

    func noteDidSet(note: Note) {
        notes.value?.append(note)
    }
}
