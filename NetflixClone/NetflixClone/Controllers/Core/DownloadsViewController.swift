//
//  DownloadsViewController.swift
//  NetflixClone
//
//  Created by Patrick on 14.11.2022..
//

import UIKit

class DownloadsViewController: UIViewController {

    private var movies = [TitleItem]()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Downloads"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        fetchLocalStorageForDownload()

        NotificationCenter.default.addObserver(forName: NSNotification.Name("downloaded"), object: nil, queue: nil) { [weak self] _ in
            self?.fetchLocalStorageForDownload()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func fetchLocalStorageForDownload() {

        DataPersistanceManager.shared.fetchItemsFromDataBase { [weak self] result in
            switch result {
            case .success(let titles):
                self?.movies = titles
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension DownloadsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let title = movies[indexPath.row]

        guard let titleName = title.original_name ?? title.original_title else {return}

        APICaller.shared.getMoview(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                DispatchQueue.main.async {
                    let vc = MoviePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: titleName, video: videoElement, titleOverview: title.overview ?? ""))
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:

            DataPersistanceManager.shared.deleteTitleWith(model: movies[indexPath.row]) { [weak self] result in
                switch result {
                case .success():
                    self?.movies.remove(at: indexPath.row)
                    self?.tableView.deleteRows(at: [indexPath], with: .fade)
                    print("Deleted")
                case .failure(let error):
                    print(error)
                }
            }

        default:
            break
        }
    }
}
extension DownloadsViewController: UITableViewDataSource {
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
