//
//  ViewController.swift
//  Animation
//
//  Created by Maram Al shahrani on 02/05/1443 AH.
//
//

import UIKit
 class ViewController: UIViewController {

     var yConstraint :NSLayoutConstraint?

     lazy var imgLbl: UILabel = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.text = "💣"
         $0.font = UIFont.systemFont(ofSize: 50)
         return $0
     }(UILabel())

     lazy var btn: UIButton = {
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
         
         view.addSubview(imgLbl)
         NSLayoutConstraint.activate([
             imgLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),

         ])
         
         view.addSubview(btn)
         NSLayoutConstraint.activate([
             btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
             btn.widthAnchor.constraint(equalToConstant: 100),
             btn.heightAnchor.constraint(equalToConstant: 100),
         ])

         yConstraint = imgLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
         yConstraint?.isActive = true
     }
     @objc func bombTbd() {
         UIView.animate(withDuration: 3) { self.yConstraint?.constant = -375
             self.view.layoutIfNeeded()
         }
     completion: { _ in
             self.imgLbl.text = "💥"
         }
     }
}


