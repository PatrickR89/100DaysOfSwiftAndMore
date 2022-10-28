//
//  ViewController.swift
//  PaymentDiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var button = UIButton()
    var data = [PaymentDetailsModel]()
    var newData = [Row]()
    var couponData: Row?
    var paymentTypeData: Row?

    enum ViewControllerSection: Hashable {
        case main
    }

    enum Section: Hashable {
        case payment
        case coupon
        case paymentType
    }

    enum Row: Hashable {
        case paymentDetails(PaymentDetailsModel)
        case coupon(CouponViewCellModel)
        case paymentTypeInfo(PaymentTypeCellModel)
    }

    private lazy var tableViewDataSource: UITableViewDiffableDataSource<Section, Row> = {
        let dataSource = UITableViewDiffableDataSource<Section, Row>(tableView: tableView) { tableView, indexPath, item in

            switch item {
            case .paymentDetails(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PaymentDetailsViewCell.self)) as? PaymentDetailsViewCell else {
                    fatalError()
                }
                cell.updateData(model: model)
                return cell
            case .coupon(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CouponViewCell.self)) as? CouponViewCell else {
                    fatalError()
                }
                cell.updateUI(model: model)
                return cell
            case .paymentTypeInfo(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PaymentTypeViewCell.self)) as? PaymentTypeViewCell else {
                    fatalError()
                }
                cell.updateLabel(model: model)
                return cell
            }
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
        view.addSubview(button)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Click me!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

//        tableView.frame = view.frame
        tableView.register(PaymentDetailsViewCell.self, forCellReuseIdentifier: String(describing: PaymentDetailsViewCell.self))
        tableView.register(CouponViewCell.self, forCellReuseIdentifier: String(describing: CouponViewCell.self))
        tableView.register(PaymentTypeViewCell.self, forCellReuseIdentifier: String(describing: PaymentTypeViewCell.self))
//        tableView.dataSource = self

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            button.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -5)
        ])
    }

    func populateData() {
        let payment1 = PaymentDetailsModel(id: UUID(), title: "Base fare", price: "10.00", currency: "$")
        let payment2 = PaymentDetailsModel(id: UUID(), title: "Distance", price: "20.00", currency: "$")
        let payment3 = PaymentDetailsModel(id: UUID(), title: "Waiting", price: "10.00", currency: "$")
        let payment4 = PaymentDetailsModel(id: UUID(), title: "Total", price: "40.00", currency: "$")
        let payment5 = PaymentDetailsModel(id: UUID(), title: "Total", price: "40.00", currency: "$")

        let data = [payment1, payment2, payment3, payment4, payment5]
        newData = data.map {
            return Row.paymentDetails($0)
        }

        let offer1 = OfferModel(name: "Apple pay")
        let offer2 = OfferModel(name: "Credit card")
        let offer3 = OfferModel(name: "Wallet")
        let offer4 = OfferModel(name: "Cash")

        couponData = .coupon(CouponViewCellModel(offer1: offer1, offer2: offer2, offer3: offer3, offer4: offer4))
        paymentTypeData = .paymentTypeInfo(PaymentTypeCellModel(name: "Apple pay"))

        configureInitialDiffableSnapshot()
    }

    func configureInitialDiffableSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()

        snapshot.appendSections([.payment, .paymentType])
        snapshot.appendItems(newData, toSection: .payment)

        if let paymentTypeData = paymentTypeData {
            snapshot.appendItems([paymentTypeData], toSection: .paymentType)
        }
        
        tableViewDataSource.apply(snapshot, animatingDifferences: false)
    }

    @objc func buttonTapped() {
        var oldSnapshot = tableViewDataSource.snapshot()
        if !oldSnapshot.sectionIdentifiers.contains(.coupon) {
            oldSnapshot.insertSections([.coupon], afterSection: .payment)
            if let couponData = couponData {
                oldSnapshot.appendItems([couponData], toSection: .coupon)
            }
            tableViewDataSource.defaultRowAnimation = .left
            tableViewDataSource.apply(oldSnapshot, animatingDifferences: true)
        } else {

            let payment6 = Row.paymentDetails(PaymentDetailsModel(id: UUID(), title: "Ugh Total", price: "40.00", currency: "$"))
            let removeItem = newData.remove(at: newData.count - 1)
            newData.append(payment6)
            oldSnapshot.deleteItems([removeItem])
            oldSnapshot.appendItems([payment6], toSection: .payment)
            tableViewDataSource.defaultRowAnimation = .top
            tableViewDataSource.apply(oldSnapshot, animatingDifferences: true)
        }
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
