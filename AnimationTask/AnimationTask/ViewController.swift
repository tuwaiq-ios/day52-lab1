//
//  ViewController.swift
//  AnimationTask
//
//  Created by Fno Khalid on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    var yConstraint: NSLayoutConstraint?
    
    var directionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowUp"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goUp), for: .touchUpInside)
        
        return button
    }()
    
    
    var bombImage: UIImageView = {
        let bomb = UIImageView()
        bomb.image = UIImage(named: "bomb")
        bomb.translatesAutoresizingMaskIntoConstraints = false
        
        return bomb
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        
        view.addSubview(directionButton)
        NSLayoutConstraint.activate([
            directionButton.widthAnchor.constraint(equalToConstant: 100),
            directionButton.heightAnchor.constraint(equalToConstant: 100),
            directionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 800),
            directionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(bombImage)
        NSLayoutConstraint.activate([
            bombImage.widthAnchor.constraint(equalToConstant: 150),
            bombImage.heightAnchor.constraint(equalToConstant: 150),
            bombImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          
        ])
        yConstraint = bombImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        yConstraint?.isActive = true
    }
    
    @objc func goUp() {
        UIView.animate(withDuration: 0.20, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            self.yConstraint?.constant = -330
            self.view.layoutIfNeeded()
        } completion:  {_ in
            self.bombImage.image = UIImage(named: "fire")
            
        }
    }


    
    
}

