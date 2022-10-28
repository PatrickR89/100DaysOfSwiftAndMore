//
//  ViewController.swift
//  Project1
//
//  Created by Patrick on 20.05.2022..
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(recommendApp))
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures)
        
        view.translatesAutoresizingMaskIntoConstraints = false 
    }
    
    
  @objc func recommendApp() {
      let vc = UIActivityViewController(activityItems: ["I recommend the Storm View app!"], applicationActivities: [])
    
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    
    present(vc, animated: true)
  }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.pictureAmount = pictures.count
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImageIndex = pictures.firstIndex(of: pictures[indexPath.row])! 
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

