//
//  NewNoteViewModelDelegate.swift
//  challenge-d74
//
//  Created by Patrick on 22.08.2022..
//

import UIKit

protocol NewNoteViewModelDelegate: AnyObject {
    func noteDidSet(note: Note)
    func noteDidChange(note: Note, index: Int)
}
