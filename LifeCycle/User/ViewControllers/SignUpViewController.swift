//
//  SignUpViewController.swift
//  LifeCycle
//
//  Created by Admin on 25/10/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signupButton)
    }
    
    @IBAction func signUpTapped(_ sender: Any){
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func validateFields() -> String?{
        if (firstNameTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "")
             {
            return "Please fill in all fields"
            }
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !Utilities.isPasswordValid(cleanedPassword){
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }else{
            createUser()
        }
        return nil
    }
    
    func createUser(){
        
        let firstName = firstNameTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil{
                self.showError("Error creating user")
            }else{
                let db = Firestore.firestore()
                db.collection("users")
                    .addDocument(
                    data: [
                        "firstname" : firstName,
                        "lastname" : lastName,
                        "uuid": result!.user.uid
                    ]) {error in
                        if (error != nil){
                            self.showError("Error saving user data!")
                        }
                    }
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
