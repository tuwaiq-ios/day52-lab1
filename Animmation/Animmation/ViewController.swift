//
//  ViewController.swift
//  Animmation
//
//  Created by Jawaher🌻 on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    var yConstraint: NSLayoutConstraint!
    lazy var Button: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(animmatio), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(" ⬆️  ", for: .normal)
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 60)
        return b
    }()
    
    public let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 100, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🌂"
        label.textAlignment = .center
        return label
    }()
    public let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 150, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🌧🌧🌧"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.6864822151, green: 0.8622206013, blue: 1, alpha: 1)
        view.addSubview(Button)
        NSLayoutConstraint.activate([
            Button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            Button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            Button.widthAnchor.constraint(equalToConstant: 400),
            Button.heightAnchor.constraint(equalToConstant: 60),
        ])
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
        ])
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600),
        ])
        
        
        yConstraint = label.topAnchor.constraint(equalTo: view.topAnchor)
        yConstraint?.isActive = true
    
    }
    @objc func animmatio() {
 
        UIView.animate(withDuration: 1) {
            
            self.yConstraint?.constant = -950
            self.view.layoutIfNeeded()
        } completion: { _ in
            
            
            self.label.text = "☂️"
            
            
        }
        
        
    }
}

