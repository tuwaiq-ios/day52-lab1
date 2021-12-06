//
//  ViewController.swift
//  Animation
//
//  Created by Fawaz on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    let boomButton = UIButton(type: .system)
    var boomEmoji = UILabel()
    var yConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .systemGray6
        setupBoomButton()
        setupBoomLabel()
    }

    func setupBoomButton(){
        view.addSubview(boomButton)
        boomButton.setImage(UIImage(systemName: "chevron.up.circle.fill"), for: .normal)
        boomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boomButton.heightAnchor.constraint(equalToConstant: 70),
            boomButton.widthAnchor.constraint(equalToConstant: 70),
            boomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
        boomButton.addTarget(self, action: #selector(boom), for: .touchDown)
        
    }
    
    func setupBoomLabel(){
        view.addSubview(boomEmoji)
        boomEmoji.translatesAutoresizingMaskIntoConstraints = false
        boomEmoji.text = "💣"
        boomEmoji.textAlignment = .center
        boomEmoji.font = .systemFont(ofSize: 60)
        NSLayoutConstraint.activate([
            boomEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boomEmoji.heightAnchor.constraint(equalToConstant: 90),
            boomEmoji.widthAnchor.constraint(equalToConstant: 90),
            boomEmoji.bottomAnchor.constraint(equalTo: boomButton.topAnchor, constant: 20)
        ])
        yConstraint = boomEmoji.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        yConstraint?.isActive = true
    }
    
    @objc func boom(){
        UIView.animate(withDuration: 0.7,
                       delay: 0.6,
                       options: .curveLinear) {
            self.yConstraint?.constant = -350
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.boomEmoji.text = "💥"
        }

    }
}

