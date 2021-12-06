//
//  ViewController.swift
//  AnimationTask
//
//  Created by dmdm on 06/12/2021.
//
import UIKit

class ViewController: UIViewController {

    let btnButton = UIButton(type: .system)
    var emoji = UILabel()
    var yConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupButterflyButton()
        setupTapLabel()
    }

    func setupButterflyButton(){
        view.addSubview(btnButton)
        btnButton.setImage(UIImage(systemName: "hand.tap"), for: .normal)
        btnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnButton.heightAnchor.constraint(equalToConstant: 70),
            btnButton.widthAnchor.constraint(equalToConstant: 70),
            btnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
        btnButton.addTarget(self, action: #selector(tap), for: .touchDown)
        
    }
    
    func setupTapLabel(){
        view.addSubview(emoji)
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.text = "☄️"
        emoji.textAlignment = .center
        emoji.font = .systemFont(ofSize: 60)
        NSLayoutConstraint.activate([
            emoji.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emoji.heightAnchor.constraint(equalToConstant: 90),
            emoji.widthAnchor.constraint(equalToConstant: 90),
            emoji.bottomAnchor.constraint(equalTo: emoji.topAnchor, constant: 20)
        ])
        yConstraint = emoji.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        yConstraint?.isActive = true
    }
    
    @objc func tap(){
        UIView.animate(withDuration: 0.7,
                       delay: 0.6,
                       options: .curveLinear) {
            self.yConstraint?.constant = -350
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.emoji.text = "💥"
        }

    }
}

