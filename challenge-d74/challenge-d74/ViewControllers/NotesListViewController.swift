//
//  ViewController.swift
//  challenge-d74
//
//  Created by Patrick on 11.08.2022..
//

import UIKit

class NotesListViewController: UITableViewController {

    let viewModel = NotesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewNote))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notes.value?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell else {fatalError("No cell found")}
        guard let noteTitle = viewModel.notes.value?[indexPath.row].title else { return cell }
        cell.setupCell(noteTitle)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editViewController = EditNoteViewController(note: viewModel.notes.value?[indexPath.row] ?? Note(title: "", content: ""), index: indexPath.row)
        let navController = UINavigationController()

        navController.viewControllers = [editViewController]
        present(navController, animated: true)
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var actions = [UIContextualAction]()

        let deleteNote = UIContextualAction(style: .normal, title: "DELETE") { [weak self] _, _, completitionHandler in
            self?.viewModel.deleteNote(index: indexPath.row)
            completitionHandler(true)
        }

        actions.append(deleteNote)
        let swipeConfig = UISwipeActionsConfiguration(actions: actions)
        swipeConfig.performsFirstActionWithFullSwipe = false
        return swipeConfig
    }
}

private extension NotesListViewController {
    func setupUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: "NoteCell")
    }

    func setupBinding() {
        viewModel.notes.bind { [weak self] notes in
            self?.tableView.reloadData()
            guard let notes = notes else {return}
            DataStorageManipulation.shared.encodeAndSave(notes)
        }
    }

    @objc func addNewNote() {
        let newNoteViewController = NewNoteViewController()
        let navController = UINavigationController()
        navController.viewControllers = [newNoteViewController]
        present(navController, animated: true)
    }
}
