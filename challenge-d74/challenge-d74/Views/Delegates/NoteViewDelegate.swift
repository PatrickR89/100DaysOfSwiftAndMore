//
//  NoteViewDelegate.swift
//  challenge-d74
//
//  Created by Patrick on 22.08.2022..
//

import UIKit

protocol NoteViewDelegate: AnyObject {
    func titleUpdated(title: String)
    func contentUpdated(content: String)
    func buttonClicked()
}
