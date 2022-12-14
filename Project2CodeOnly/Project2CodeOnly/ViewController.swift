//
//  ViewController.swift
//  Project2CodeOnly
//
//  Created by Patrick on 25.05.2022..
//

import UIKit

class ViewController: UIViewController {
    
  let button1 = UIButton(type: .custom)
  let button2 = UIButton(type: .custom)
  let button3 = UIButton(type: .custom)
    
  var countries = [String]()
  var score = 0
  var correctAnswer = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
        
    view.addSubview(button1)
    modifyButton1()
    view.addSubview(button2)
    modifyButton2()
    view.addSubview(button3)
    modifyButton3()

    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    askQuestion()

  }
    

}

// MARK: Buttons 1 - 3 implementation

extension ViewController {
  func modifyButton1(){
    button1.setTitle("", for: .normal)
    button1.layer.borderWidth = 1
    button1.layer.borderColor = UIColor.lightGray.cgColor
    button1.tag = 0
    button1.translatesAutoresizingMaskIntoConstraints = false


    button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      view.safeAreaLayoutGuide.topAnchor.constraint(greaterThanOrEqualTo: button1.topAnchor, constant: -20).isActive = true
      button1.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true

      button1.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.2).isActive = true
//    button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
      button1.widthAnchor.constraint(equalTo: button1.heightAnchor, multiplier: 2).isActive = true
    button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }


    
  func modifyButton2(){
    button2.setTitle("", for: .normal)
    button2.backgroundColor = .green
    button2.layer.borderWidth = 1
    button2.layer.borderColor = UIColor.lightGray.cgColor
    button2.tag = 1
    button2.translatesAutoresizingMaskIntoConstraints = false
      button2.widthAnchor.constraint(equalTo: button1.widthAnchor).isActive = true
      button2.heightAnchor.constraint(equalTo: button2.widthAnchor, multiplier: 0.5).isActive = true
//    button2.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40).isActive = true
    button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
  
  func modifyButton3() {
    button3.setTitle("", for: .normal)
    button3.backgroundColor = .red
    button3.layer.borderWidth = 1
    button3.layer.borderColor = UIColor.lightGray.cgColor
    button3.tag = 2
    button3.translatesAutoresizingMaskIntoConstraints = false
      button3.widthAnchor.constraint(equalTo: button1.widthAnchor).isActive = true
      button3.heightAnchor.constraint(equalTo: button3.widthAnchor, multiplier: 0.5).isActive = true
//    button3.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 40).isActive = true
      view.safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: button3.bottomAnchor, constant: 20).isActive = true
    button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
}

// MARK: Implement functionality

extension ViewController {
  func askQuestion(action: UIAlertAction! = nil) {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
    
    title = countries[correctAnswer].uppercased()
  }
  
  @objc func buttonAction(_ sender: UIButton!){
    
    var title: String
    
    if sender.tag == correctAnswer {
      title = "Correct"
      score += 1
    } else {
      title = "Wrong"
      score -= 1
    }
    
    let ac = UIAlertController(title: title, message: "Your current score is: \(score)", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
    
    present(ac, animated: true)
  }
  
}

