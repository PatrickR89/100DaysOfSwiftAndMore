//
//  MemeViewController+Extensions.swift
//  challenge-d90
//
//  Created by Patrick on 31.08.2022..
//

import UIKit

extension MemeViewController: MemeViewDelegate {
    func memeViewDidTapImage() {
        guard let picker = imageViewModel?.createPickerController(in: self) else {return}
        present(picker, animated: true)
    }
}

extension MemeViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        imageViewModel?.createNewImage(image: image)
        dismiss(animated: true)
    }
}

extension MemeViewController: UINavigationControllerDelegate {}
