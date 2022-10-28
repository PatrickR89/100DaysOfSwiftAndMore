//
//  ViewController.swift
//  challenge-d59
//
//  Created by Patrick on 20.07.2022..
//

import UIKit

class CountriesViewController: UIViewController {

    var tableView = UITableView()
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configTableView()
        fetchCountries()
    }
}
extension CountriesViewController {
    func configTableView() {
        view.addSubview(tableView)
        tableView.register(CountryCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func fetchCountries() {
        if let countriesURL = Bundle.main.url(forResource: "countriesChallenge", withExtension: ".json") {
            do {
                let countries = try String(contentsOf: countriesURL)
                let data = Data(countries.utf8)
                self.countries = try JSONDecoder().decode([Country].self, from: data)
            } catch {
                print("Error occured during loading file: \(error)")
            }
        }
    }
}
extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CountryCell else {fatalError("no cell found")}
        let country = countries[indexPath.row]
        let image = country.name.lowercased()
        cell.setupCell(name: country.name, image: image)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailView = CountryDetailViewController(country: countries[indexPath.row])

        self.present(detailView, animated: true, completion: nil)
    }
}


