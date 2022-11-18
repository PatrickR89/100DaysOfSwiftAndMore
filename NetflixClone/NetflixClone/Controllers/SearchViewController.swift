//
//  SearchViewController.swift
//  NetflixClone
//
//  Created by Patrick on 14.11.2022..
//

import UIKit

class SearchViewController: UIViewController {

    private var movies = [MediaObject]()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Searches"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        fetchTopSearched()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func fetchTopSearched() {
        APICaller.shared.getTopSearchedMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let title = (movies[indexPath.row].original_title ?? movies[indexPath.row].original_name) ?? "unknown"
        cell.configure(with: MovieViewModel(titleName: title, posterURL: movies[indexPath.row].poster_path ?? ""))

        return cell
    }
}
