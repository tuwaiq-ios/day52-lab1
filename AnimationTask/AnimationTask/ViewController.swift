//
//  ViewController.swift
//  AnimationTask
//
//  Created by  HANAN ASIRI on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
  var yConstraint: NSLayoutConstraint?
    
  var dButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "a-icone"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goUp), for: .touchUpInside)
    return button
  }()
    
    
  var bImage: UIImageView = {
    let bomb = UIImageView()
    bomb.image = UIImage(named: "b-icone")
    bomb.translatesAutoresizingMaskIntoConstraints = false
    return bomb
  }()
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
      view.backgroundColor = .cyan
      
    
      
    view.addSubview(bImage)
    NSLayoutConstraint.activate([
      bImage.widthAnchor.constraint(equalToConstant: 150),
      bImage.heightAnchor.constraint(equalToConstant: 150),
      bImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
      
      view.addSubview(dButton)
      NSLayoutConstraint.activate([
        dButton.widthAnchor.constraint(equalToConstant: 100),
        dButton.heightAnchor.constraint(equalToConstant: 100),
        dButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 750),
        dButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      ])
      
    yConstraint = bImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
    yConstraint?.isActive = true
  }
    
    
  @objc func goUp() {
    UIView.animate(withDuration: 0.20, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: .curveEaseIn) {
      self.yConstraint?.constant = -330
      self.view.layoutIfNeeded()
    } completion: {_ in
      self.bImage.image = UIImage(named: "f-icone")
    }
    }
    }
