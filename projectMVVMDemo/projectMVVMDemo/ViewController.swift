//
//  ViewController.swift
//  projectMVVMDemo
//
//  Created by Patrick on 13.08.2022..
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var btnSearch = UIButton()
    var txtSearch =  UITextField()
    var activityIndicator = UIActivityIndicatorView()

    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUiView()
    }

    @objc func searchButtonPressed(_ sender: Any) {
        viewModel.performSearch()
    }
}

private extension ViewController {
    func setupUiView() {

        view.addSubview(activityIndicator)
        view.addSubview(txtSearch)
        view.addSubview(btnSearch)
        view.addSubview(tableView)

        txtSearch.translatesAutoresizingMaskIntoConstraints = false
        txtSearch.backgroundColor = .white
        txtSearch.layer.cornerRadius = 3
        txtSearch.layer.borderColor = UIColor.gray.cgColor
        txtSearch.layer.borderWidth = 1
        txtSearch.font = UIFont.systemFont(ofSize: 30)
        txtSearch.textColor = .black
        txtSearch.delegate = self

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        btnSearch.setTitle("Search", for: .normal)
        btnSearch.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)


        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .white
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            txtSearch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            txtSearch.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            txtSearch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            activityIndicator.leadingAnchor.constraint(equalTo: txtSearch.trailingAnchor, constant: 10),
            activityIndicator.centerYAnchor.constraint(equalTo: txtSearch.centerYAnchor),
            btnSearch.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            btnSearch.topAnchor.constraint(equalTo: txtSearch.bottomAnchor, constant: 15),
            btnSearch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: btnSearch.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        setupBindings()
    }

    func setupBindings() {
        viewModel.results.bind { [weak self] _ in
            self?.tableView.reloadData()
        }

        viewModel.isButtonEnabled.bind { [weak self] isEnabled in
            if isEnabled {
                self?.btnSearch.backgroundColor = .systemBlue
            } else {
                self?.btnSearch.backgroundColor = .lightGray
            }
            self?.btnSearch.isEnabled = isEnabled
        }

        viewModel.isLoadingEnabled.bind { [weak self] isEnabled in
            if isEnabled {
                self?.activityIndicator.isHidden = false
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.isHidden = true
                self?.activityIndicator.stopAnimating()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.results.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("Uh no cell")}
        let itm = viewModel.getSearchResultVM(at: indexPath.row)
        var content = cell.defaultContentConfiguration()
        content.text = itm.trackName
        content.secondaryText = itm.collectionName
        cell.contentConfiguration = content
        cell.backgroundColor = .gray
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.searchText = textField.text
    }
}
