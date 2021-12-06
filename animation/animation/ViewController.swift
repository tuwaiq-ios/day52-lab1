//
//  ViewController.swift
//  animation
//
//  Created by Tsnim Alqahtani on 02/05/1443 AH.
//



import UIKit

class ViewController: UIViewController {

    let btn = UIButton(type: .system)
    
    
    var bEmoji = UILabel()
    
    
    var yConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupAButton()
        setupBLabel()
    
    }

    func setupAButton(){
        view.addSubview(btn)
        btn.setImage(UIImage(systemName: "arrow.up.square"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        btn.heightAnchor.constraint(equalToConstant: 70),
        btn.widthAnchor.constraint(equalToConstant: 70),
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        btn.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        
    }
    
    func setupBLabel(){
        view.addSubview(bEmoji)
        bEmoji.translatesAutoresizingMaskIntoConstraints = false
        bEmoji.textAlignment = .center
        bEmoji.font = .systemFont(ofSize: 90)
        bEmoji.text = "🧨"
        NSLayoutConstraint.activate([
        bEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bEmoji.heightAnchor.constraint(equalToConstant: 90),
        bEmoji.widthAnchor.constraint(equalToConstant: 90),
        bEmoji.bottomAnchor.constraint(equalTo:
        btn.topAnchor, constant: 40)
        ])
        
        
        yConstraint = bEmoji.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        yConstraint?.isActive = true
    }
    
    @objc func btnPressed(){
        UIView.animate(withDuration: 0.1, delay: 0.5, options: .curveLinear) {
        self.yConstraint?.constant = -100
        self.bEmoji.text = "🎇"
        self.view.layoutIfNeeded() } completion: { _ in}

    }
}

