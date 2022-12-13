//
//  MainViewController.swift
//  LifeCycle
//
//  Created by Admin on 25/10/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(signupButton)
    }

}
