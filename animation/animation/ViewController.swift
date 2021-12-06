//
//  ViewController.swift
//  animation
//
//  Created by PC  on 02/05/1443 AH.
//

import UIKit

import UIKit
 class ViewController: UIViewController {

     var yConstraint :NSLayoutConstraint?

    lazy var image: UILabel = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.text = "💣"
         $0.font = UIFont.systemFont(ofSize: 50)
         return $0
     }(UILabel())

     let btn: UIButton = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.backgroundColor = .white
         $0.setTitleColor(.red, for: .normal)
         $0.layer.cornerRadius = 12
         $0.setTitle("BOMB", for: .normal)
         $0.addTarget(self, action: #selector(bombTbd), for: .touchUpInside)
         $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
         return $0
     }(UIButton())

     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         view.addSubview(image)
         NSLayoutConstraint.activate([
             image.centerXAnchor.constraint(equalTo: view.centerXAnchor),

         ])
         
         view.addSubview(btn)
         NSLayoutConstraint.activate([
             btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
             btn.widthAnchor.constraint(equalToConstant: 100),
             btn.heightAnchor.constraint(equalToConstant: 100),
         ])

         yConstraint = image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
         yConstraint?.isActive = true
     }
     @objc func bombTbd() {
         UIView.animate(withDuration: 3) { self.yConstraint?.constant = -385
             self.view.layoutIfNeeded()
         }
     completion: { _ in
         self.image.text = "💥"
         self.image.font = UIFont.systemFont(ofSize: 300)
         self.view.backgroundColor = .red
         
         }
     }
}
