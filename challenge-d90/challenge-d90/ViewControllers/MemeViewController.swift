//
//  MemeViewController.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

enum Position {
    case top
    case bottom
}

class MemeViewController: UIViewController {

    var memeView: MemeView
    var viewModel: MemeVCViewModel
    var imageViewModel: MemeVCImageViewModel?

    init( memeViewModel: MemeViewModel, with viewmModel: MemeVCViewModel){
        self.viewModel = viewmModel
        self.memeView = MemeView(with: memeViewModel)

        super.init(nibName: nil, bundle: nil)
        self.imageViewModel = MemeVCImageViewModel(in: self, with: memeView.viewModel)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindNavigationUnit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "CLOSE", style: .plain, target: self, action: #selector(closeSelf))
    }
}

private extension MemeViewController {
    func setupUI() {
        view.addSubview(memeView)
        memeView.delegate = self
        memeView.frame = view.frame
    }

    func bindNavigationUnit() {
        viewModel.observeImageState { isImageLoaded in
            DispatchQueue.main.async { [weak self] in
                self?.setBarButton(isImageLoaded)
            }
        }
    }

    func setBarButton(_ isImageLoaded: Bool) {
        if isImageLoaded {
            let editBarButton = UIBarButtonItem(title: "EDIT", style: .plain, target: self, action: #selector(addText))
            self.navigationItem.leftBarButtonItem = editBarButton
        }
    }

    @objc func closeSelf() {
        self.dismiss(animated: true)
    }

    @objc func addText() {
        guard let alertController = imageViewModel?.createAlertController() else {return}
        present(alertController, animated: true)
    }
}
