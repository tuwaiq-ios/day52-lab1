//
//  ViewController.swift
//  animationTask
//
//  Created by sara al zhrani on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    var yanchor: NSLayoutConstraint?
    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("⬆️", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.systemMint, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(sendPressed), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    let boomblable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "💣"
        label.font = label.font.withSize(19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(Button1 )
        view.addSubview(boomblable)
        
        NSLayoutConstraint.activate([
            Button1 .centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 10),
            Button1 .centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 400),
            Button1 .heightAnchor.constraint(equalTo: view.heightAnchor,constant: 5),
            Button1 .widthAnchor.constraint(equalTo: view.widthAnchor,constant: 5),
            
            
            boomblable.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 200),
           
            boomblable.heightAnchor.constraint(equalTo: view.heightAnchor,constant: 20),
            boomblable.widthAnchor.constraint(equalTo: view.widthAnchor,constant: 20),
        ])
        yanchor =  boomblable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 350)
        yanchor?.isActive = true
    
        
        
    }
    


    @objc func sendPressed() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn){
            self.yanchor?.constant = -300
            self.view.layoutIfNeeded()
            
            
        }completion: { _ in
            self.boomblable.text = " 🔥"
        }
        
    }
}

