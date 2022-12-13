//
//  AutoLayoutConstraintsAnimationViewController.swift
//  LifeCycle
//
//  Created by Admin on 12/10/22.
//

import UIKit

class AutoLayoutConstraintsAnimationViewController: UIViewController {
    
    fileprivate var heightAnchor: NSLayoutConstraint!
    fileprivate var widthAnchor: NSLayoutConstraint!
    var leftAnchor: NSLayoutConstraint!
    var rightAnchor: NSLayoutConstraint!
    var topAnchor: NSLayoutConstraint!
    var bottomAnchor: NSLayoutConstraint!
    
    lazy var mainImageview : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1.jpg"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAnimation)))
        return imageView
    }()
    
    lazy var mainButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemRed
        button.setTitle("Animate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageview)
        topAnchor = mainImageview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        topAnchor?.isActive = true
        leftAnchor = mainImageview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        leftAnchor?.isActive = true
        
        rightAnchor = mainImageview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        mainImageview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bottomAnchor = mainImageview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        mainImageview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainImageview.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageview.heightAnchor.constraint(equalToConstant: 100).isActive = true

        heightAnchor = mainButton.heightAnchor.constraint(equalToConstant: 60)
        widthAnchor = mainButton.widthAnchor.constraint(equalToConstant: 100)
        heightAnchor.isActive = true
        widthAnchor.isActive = true
        mainButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        mainButton.addTarget(self, action: #selector(handleAnimation), for: .touchUpInside)
    }
    
    @objc fileprivate func handleAnimation () {
        heightAnchor.constant = 300
        widthAnchor.constant = 200
        leftAnchor?.isActive = false
        rightAnchor?.isActive = true
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: {_ in
            self.animateAgain()
        })
    }
    
    func animateAgain() {
        heightAnchor.constant = 60
        widthAnchor.constant = 100
        self.rightAnchor?.isActive = false
        self.leftAnchor?.isActive = true
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, animations: {
            self.view.layoutIfNeeded()
        })
    }

}


