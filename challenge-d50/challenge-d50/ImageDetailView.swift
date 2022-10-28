//
//  ImageDetailView.swift
//  challenge-d50
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

class ImageDetailView: UIViewController {

    var imageView = UIImageView()
    var captionLabel = UILabel()
    var indexPath: IndexPath
    weak var delegate: ImageDetailViewControllerDelegate?

    init(image: ImageData, indexPath: IndexPath){
        captionLabel.text = image.caption
            let path = FileManager.default.getFilePath(image.image)
            imageView.image = UIImage(contentsOfFile: path.path)
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configImageView()
        configLabel()

    }

    func configImageView() {
        view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configLabel() {
        view.addSubview(captionLabel)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeCaption))
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.isUserInteractionEnabled = true

        captionLabel.textAlignment = .center
        captionLabel.font = UIFont.systemFont(ofSize: 35)
        captionLabel.addGestureRecognizer(gesture)

        NSLayoutConstraint.activate([
            captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            captionLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }

    @objc func changeCaption() {
        let alertController = UIAlertController(title: "Rename", message: nil, preferredStyle: .alert)
        alertController.addTextField()

        let alertAction = UIAlertAction(title: "OK", style: .default) {[weak self, weak alertController] _ in
            guard let newCaption = alertController?.textFields?[0].text else {return}
            guard let indexPath = self?.indexPath else {return}
            self?.captionLabel.text = newCaption
            self?.delegate?.changeCaption(caption: newCaption, indexPath: indexPath)
        }

        let cancelAction = UIAlertAction(title: "Cance", style: .cancel)

        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }
}

protocol ImageDetailViewControllerDelegate: AnyObject {
    func changeCaption(caption: String, indexPath: IndexPath)
}


