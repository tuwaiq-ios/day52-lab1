//
//  ViewController.swift
//  animationSara
//
//  Created by sara saud on 02/05/1443 AH.
//

import Foundation

import UIKit

class ViewController: UIViewController {
    
    var yContraint: NSLayoutConstraint?
    
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "1"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(pandaPressed), for: .touchDown)
        return btn
    }()
    
    
    lazy var lable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "🍯"
        lbl.font.withSize(100)
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "hony")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
            
        
        view.addSubview(button)
        view.addSubview(lable)
        NSLayoutConstraint.activate([
            
//            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
//            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 100),
//            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200) ,
            button.widthAnchor.constraint(equalToConstant: 50) ,
            button.heightAnchor.constraint(equalToConstant: 50),
            
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
//            lable.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            lable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            
        ])
        
        
        yContraint = lable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170)
            
        self.yContraint?.isActive = true
        

    }
    @objc func pandaPressed() {
//
//        UIView.animate(withDuration: 3){
//            self.yContraint?.constant = 300
//            self.view.layoutIfNeeded()
//        } completion: { _ in
//            self.yContraint?.constant = 0
//            self.view.layoutIfNeeded()
//        }
        UIView.animate(withDuration: 3, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.yContraint?.constant = -150
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.lable.text = "🗯"
            
            
        }
        
        
        print("Hello Panda 🐼!")
        
    
    }

}

