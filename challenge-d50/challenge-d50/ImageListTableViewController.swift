//
//  ImageListTableViewController.swift
//  challenge-d50
//
//  Created by Patrick on 12.07.2022..
//

import UIKit

class ImageListTableViewController: UITableViewController {

    var imageList = [ImageData]() {
        didSet {
            saveImages()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadImages()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNew))
    }

}

extension ImageListTableViewController {
    @objc func addNew() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    func configTableView() {
        tableView.register(ImageCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageCell else {fatalError("no cell loaded")}
        cell.setupCell(image: imageList[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = imageList[indexPath.row]

        let imageDetailView = ImageDetailView(image: image, indexPath: indexPath)
        imageDetailView.delegate = self
        navigationController?.pushViewController(imageDetailView, animated: true)
    }

    func saveImages() {
        do {
        let jsonImages = try JSONEncoder().encode(imageList)
            let userDefaults = UserDefaults.standard
            userDefaults.set(jsonImages, forKey: "images")
        } catch {
            print(error)
        }
    }

    func loadImages() {
        let userDefaults = UserDefaults.standard
        guard let savedImages = userDefaults.object(forKey: "images") as? Data else {return}

        do {
            imageList = try JSONDecoder().decode([ImageData].self, from: savedImages)
        } catch {
            print("Loading failed")
        }
    }
}

extension ImageListTableViewController: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        let imageName = UUID().uuidString
        let imagePath = FileManager.default.getFilePath(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }

        let newImage = ImageData(caption: "noname", image: imageName)
        imageList.append(newImage)

        addRowToTable()
        self.dismiss(animated: true)
    }
}

extension ImageListTableViewController {
    func addRowToTable() {
        var section = tableView.numberOfSections - 1
        if section < 0 {
            section = 0
        }
        var row = tableView.numberOfRows(inSection: section) - 1
        if row < 0 {
            row = 0
        }
        let newIndexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        return paths[0]
    }

    func getFilePath(_ name: String) -> URL {
        let filePath = getDocumentsDirectory().appendingPathComponent(name)

        return filePath
    }
}

extension ImageListTableViewController: ImageDetailViewControllerDelegate {
    func changeCaption(caption: String, indexPath: IndexPath) {
        imageList[indexPath.row].caption = caption
        tableView.reloadRows(at: [indexPath], with: .middle)
    }

    
}

extension ImageListTableViewController: UINavigationControllerDelegate {}


