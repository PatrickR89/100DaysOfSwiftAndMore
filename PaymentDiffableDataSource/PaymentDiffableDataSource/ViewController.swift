//
//  ViewController.swift
//  PaymentDiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var data = [PaymentDetailsModel]()

    enum ViewControllerSection: Hashable {
        case main
    }

    private lazy var tableViewDataSource: UITableViewDiffableDataSource<ViewControllerSection, PaymentDetailsModel> = {
        let dataSource = UITableViewDiffableDataSource<ViewControllerSection, PaymentDetailsModel>(tableView: tableView) { tableView, _, model in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "details") as? PaymentDetailsViewCell else {
                fatalError("no cell!!!!")
            }

            cell.updateData(model: model)
            return cell
        }
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
        setupUI()
    }

    func setupUI() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.register(PaymentDetailsViewCell.self, forCellReuseIdentifier: "details")
//        tableView.dataSource = self
    }

    func populateData() {
        let payment1 = PaymentDetailsModel(title: "Base fare", price: "10.00", currency: "$")
        let payment2 = PaymentDetailsModel(title: "Distance", price: "20.00", currency: "$")
        let payment3 = PaymentDetailsModel(title: "Waiting", price: "10.00", currency: "$")
        let payment4 = PaymentDetailsModel(title: "Total", price: "40.00", currency: "$")

        data = [payment1, payment2, payment3, payment4]
        configureInitialDiffableSnapshot()
    }

    func configureInitialDiffableSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ViewControllerSection, PaymentDetailsModel>()

        snapshot.appendSections([.main])
        snapshot.appendItems(data, toSection: .main)
        tableViewDataSource.apply(snapshot, animatingDifferences: false)
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        data.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "details", for: indexPath) as? PaymentDetailsViewCell else {
//            fatalError("no cell")
//        }
//
//        cell.updateData(model: data[indexPath.row])
//        return cell
//    }
//}
