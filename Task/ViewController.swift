//
//  ViewController.swift
//  Task
//
//  Created by Amal on 02/05/1443 AH.
//

import UIKit
class ViewController: UIViewController {
    
    var yconstraint :NSLayoutConstraint?
    
    lazy var img: UILabel = {
        let img = UILabel()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.text = "🍭"
        return img
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        btn.setTitle("Go", for: .normal)
        btn.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        btn.setTitleColor(.black , for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(img)
        NSLayoutConstraint.activate([
            img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            img.widthAnchor.constraint(equalToConstant: 50),
            img.heightAnchor.constraint(equalToConstant: 10),
        ])
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            btn.widthAnchor.constraint(equalToConstant: 100),
            btn.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        yconstraint = img.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        yconstraint?.isActive = true
    }
    @objc func ButtonTapped() {
        UIView.animate(withDuration: 3) { self.yconstraint?.constant = -300
            self.view.layoutIfNeeded()
        }
    completion: { _ in
            self.img.text = "🎉"
        }
    }
    }
