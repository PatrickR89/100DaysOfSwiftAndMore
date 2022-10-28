//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class ViewController: UIViewController {

    var tableView: TableView
    var dataSource: DataSource

    var singleOptions = SelectionOption<NumberOption>(NumberOption.allCases, selected: [.two])
    var multipleOptions = SelectionOption<LetterOption>(LetterOption.allCases, selected: [.a, .c], multiple: true)

    init() {
        self.tableView = TableView(style: .insetGrouped)
        self.dataSource = DataSource(tableView)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        NSLayoutConstraint.activate(tableView.layoutConstraints(in: view))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Table view"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(CustomCell.self)
        tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        reload()
    }

    func reload() {
        dataSource.reload([
            .init(key: .numbers, values: NumberOption.allCases.map {.number($0)}),
            .init(key: .letters, values: LetterOption.allCases.map {.letter($0)})
        ])

        tableView.select(dataSource.selectedIndexPaths(singleOptions) { .number($0)})
        tableView.select(dataSource.selectedIndexPaths(multipleOptions) { .letter($0)})
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectionId = dataSource.sectionIdentifier(for: indexPath.section) else {
            return
        }

        switch selectionId {
        case .numbers:
            guard case let .number(model) = dataSource.itemIdentifier(for: indexPath) else {
                return
            }

            tableView.deselectAllInSection(except: indexPath)
            singleOptions.toggle(model)
            print(singleOptions.selectedValues)
        case .letters:
            guard case let .letter(model) = dataSource.itemIdentifier(for: indexPath) else {
                return
            }

            multipleOptions.toggle(model)
            print(multipleOptions.selectedValues)
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let sectionId = dataSource.sectionIdentifier(for: indexPath.section) else {
            return
        }

        switch sectionId {
        case .numbers:
            tableView.select([indexPath])
        case .letters:
            guard case let .letter(model) = dataSource.itemIdentifier(for: indexPath) else {
                return
            }
            multipleOptions.toggle(model)
            print(multipleOptions.selectedValues)
        }
    }
}
