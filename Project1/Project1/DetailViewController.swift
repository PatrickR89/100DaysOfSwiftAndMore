//
//  DetailViewController.swift
//  Project1
//
//  Created by Patrick on 20.05.2022..
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var pictureAmount: Int?
    var selectedImageIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        title = "Image \(selectedImageIndex! + 1) of \(pictureAmount!)"
        navigationItem.largeTitleDisplayMode = .never
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
              
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        if let total = pictureAmount {
            print(total)
        }
        
        if let index = selectedImageIndex {
            print(index)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
  @objc func shareTapped() {
    guard let imageTitle = selectedImage else {
      print("No title")
      return
    }
    guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
      print("No image")
      return
    }
    
    let vc = UIActivityViewController(activityItems: [image, imageTitle], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }

}
