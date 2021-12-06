//
//  ViewController.swift
//  Animation Task
//
//  Created by alanood on 02/05/1443 AH.
//


import UIKit
 class ViewController: UIViewController {

     var yConstraint :NSLayoutConstraint?

     lazy var imgeLable: UILabel = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.text = "💣"
         $0.font = UIFont.systemFont(ofSize: 50)
         return $0
     }(UILabel())

     lazy var button: UIButton = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.backgroundColor = .black
         $0.setTitleColor(.red, for: .normal)
         $0.layer.cornerRadius = 12
         $0.setTitle("BOMB", for: .normal)
         $0.addTarget(self, action: #selector(bombTbd), for: .touchUpInside)
         $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
         $0.frame = CGRect(x: 15, y: 54, width: 300, height: 500)
         return $0
     }(UIButton())

     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         view.addSubview(imgeLable)
         NSLayoutConstraint.activate([
            imgeLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),

         ])
         
         view.addSubview(button)
         NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100),
         ])

         yConstraint = imgeLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
         yConstraint?.isActive = true
     }
     @objc func bombTbd() {
         UIView.animate(withDuration: 3) { self.yConstraint?.constant = -375
             self.view.layoutIfNeeded()
         }
     completion: { _ in
             self.imgeLable.text = "💥"
         }
     }
}


