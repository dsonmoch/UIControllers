//
//  UserViewController.swift
//  LifeCycle
//
//  Created by Admin on 25/10/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    @IBAction func loginTapped(_ sender: Any){
        let email = emailTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }else{
                self.transitionToHome()
            }
        }
    }
    
    func transitionToHome(){
        guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeViewController) as? HomeViewController else { return  }
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: false)
    }
    

}
