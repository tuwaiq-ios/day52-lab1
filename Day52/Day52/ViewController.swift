//
//  ViewController.swift
//  Day52
//
//  Created by Sara M on 02/05/1443 AH.
//
import UIKit

class ViewController: UIViewController {

    let Button = UIButton(type: .system)
    var emoji = UILabel()
    var yConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupButton()
        setupTapLabel()
    }

    func setupButton(){
        view.addSubview(Button)
        Button.setImage(UIImage(systemName: "rectangle.and.hand.point.up.left.filled"), for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Button.heightAnchor.constraint(equalToConstant: 70),
            Button.widthAnchor.constraint(equalToConstant: 70),
            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
        Button.addTarget(self, action: #selector(tap), for: .touchDown)
        
    }
    
    func setupTapLabel(){
        view.addSubview(emoji)
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.text = "💣"
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

