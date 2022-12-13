//
//  UserDefaultViewController.swift
//  LifeCycle
//
//  Created by Admin on 13/10/22.
//

import UIKit

class UserDefaultViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
        setLabel()
    }
    
    @IBAction func buttonClicked (_ sender: Any) {
        UDM.shared.defaults.setValue(userInput.text, forKey: "name")
        let alert = UIAlertController(title: "Saved", message: "User default saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        present(alert, animated: true)
        setLabel()
    }
    
    
    func setLabel(){
        if let value = UDM.shared.defaults.value(forKey: "name") as? String{
            labelText.text = value
        }
    }


}

class UDM{
    static let shared = UDM()
        let defaults = UserDefaults(suiteName: "com.text.saved.data")!
}
