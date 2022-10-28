//
//  MemeVCImageViewModel.swift
//  challenge-d90
//
//  Created by Patrick on 01.09.2022..
//

import UIKit

class MemeVCImageViewModel {

    var viewController: UIViewController
    var viewModel: MemeViewModel

    init(in viewController: UIViewController, with viewModel: MemeViewModel){
        self.viewController = viewController
        self.viewModel = viewModel
    }

    // MARK: Create Alert Controller

    func createAlertController() -> UIAlertController {

        let alertController = UIAlertController(title: "Edit or delete meme", message: nil, preferredStyle: .actionSheet)
        let addTextToTop = addAlertAction(at: Position.top, to: alertController)
        let addBottomText = addAlertAction(at: Position.bottom, to: alertController)

        let deleteImage = UIAlertAction(title: "DELETE MEME", style: .destructive) { [weak viewController, weak viewModel] _ in
            guard let meme = viewModel?.returnMeme() else {return}
            let imageName = meme.image
            let path = FileManager.default.getFilePath(imageName)
            do {
                try FileManager.default.removeItem(at: path)
            } catch {
                print("Error in deleting")
            }
            viewModel?.deleteMeme()
            viewController?.dismiss(animated: true)
        }

        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel)

        if let addTextToTop = addTextToTop {
            alertController.addAction(addTextToTop)
        }

        if let addBottomText = addBottomText {
            alertController.addAction(addBottomText)
        }

        alertController.addAction(deleteImage)
        alertController.addAction(cancelAction)

        return alertController
    }

    // MARK: Create AlertActions for top and bottom text

    private func addAlertAction(at position: Position, to alertController: UIAlertController) -> UIAlertAction? {
        var title: String
        guard let meme = viewModel.returnMeme() else {return nil}
        switch position {
        case .top:
            title = "Add text on top"
        case .bottom:
            title = "Add text on bottom"
        }

        let alertAction = UIAlertAction(title: title, style: .default) { [weak viewController, weak alertController] _ in
            let textAlertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            textAlertController.addTextField()
            let addText = UIAlertAction(title: "Add", style: .default) { [weak textAlertController, weak self] _ in
                guard let meme = self?.viewModel.returnMeme(),
                      let text = textAlertController?.textFields?[0].text else {return}
                DispatchQueue.global(qos: .userInitiated).async {
                    self?.editImage(meme: meme, text: text, at: position)
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            textAlertController.addAction(addText)
            textAlertController.addAction(cancel)
            alertController?.dismiss(animated: true)
            viewController?.present(textAlertController, animated: true)
        }

        switch position {

        case .top:
            if !meme.topText {
                return alertAction
            } else {
                return nil
            }
        case .bottom:
            if !meme.bottomText {
                return alertAction
            } else {
                return nil
            }
        }
    }

    // MARK: editImage function for Alert Controller

    private func editImage(meme: Meme, text: String, at textPosition: Position) {
        let path = FileManager.default.getFilePath(meme.image)
        let image = UIImage(contentsOfFile: path.path)

        guard let image = image else {return}

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.preferredRange = .standard

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: image.size.width, height: image.size.height), format: format)
        let newImage = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let paragraphAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.preferredFont(forTextStyle: .largeTitle),
                .foregroundColor: UIColor.white,
                .backgroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3),
                .paragraphStyle: paragraphStyle
            ]
            let attributedString = NSAttributedString(string: text, attributes: paragraphAttributes)

            image.draw(at: CGPoint(x: 0, y: 0))

            let textFrame = createTextFrame(size: image.size, position: textPosition)
            attributedString.draw(with: textFrame, options: .usesLineFragmentOrigin, context: nil)
        }

        saveImage(image: newImage, path: path)

        DispatchQueue.main.async { [weak viewModel] in
            switch textPosition {
            case .top:
                let tempMeme = Meme(image: meme.image, topText: true, bottomText: meme.bottomText)
                viewModel?.updateMeme(meme: tempMeme)
            case .bottom:
                let tempMeme = Meme(image: meme.image, topText: meme.topText, bottomText: true)
                viewModel?.updateMeme(meme: tempMeme)
            }
        }
    }
    // MARK: Create text frame for image editing

    private func createTextFrame(size: CGSize, position: Position) -> CGRect {
        let width = size.width * 0.9
        let height = size.height * 0.2
        let x = size.width * 0.05
        var y: CGFloat = 0
        switch position {
        case .top:
            y = size.height * 0.1
        case .bottom:
            y = size.height - height
        }

        return CGRect(x: x, y: y, width: width, height: height)
    }
    // MARK: Save image

    func saveImage(image: UIImage, path: URL) {
        if let jpegData = image.jpegData(compressionQuality: 0.5) {
            try? jpegData.write(to: path)
        }
    }
    // MARK: Create UIImagePickerController

    func createPickerController(in viewController: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> UIImagePickerController {
        let picker  = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = viewController
        return picker
    }
    // MARK: Create new image

    func createNewImage(image: UIImage) {
        let imageName = UUID().uuidString
        let imagePath = FileManager.default.getFilePath(imageName)

        saveImage(image: image, path: imagePath)

        let tempMeme = Meme(image: imageName, topText: false, bottomText: false)
        viewModel.updateMeme(meme: tempMeme)
    }
}
