//
//  CountryDetailViewController.swift
//  challenge-d59
//
//  Created by Patrick on 21.07.2022..
//

import UIKit

class CountryDetailViewController: UIViewController {

    private lazy var imageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var textField = UILabel()
    let country: Country

    required init(country: Country) {
        self.country = country

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configImageView()
        configName()
        configTextField()
    }

    func configImageView() {
        view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 0.3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.image = UIImage(named: country.name.lowercased())

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.66)
        ])
    }

    func configName() {
        view.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 44)
        nameLabel.text = country.name

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    func configTextField() {

        view.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.numberOfLines = 0
        textField.text = country.funFact

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }

}
