//
//  KeyChainViewController.swift
//  LifeCycle
//
//  Created by Admin on 13/10/22.
//

import UIKit

class KeyChainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserName()
    }
    
    @IBAction func didTouchSave(_ sender: Any){
        save()
    }
    
    @IBAction func didTouchLogout(_ sender: Any){
        getUserName()
    }
    
    func getUserName(){
        let alert = UIAlertController(title: "Retrive Password", message: "Enter Your Account Name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let name = field.text, !name.isEmpty else{
                return
            }
            
            self?.getPassword(name: name)
        }))
        present(alert, animated: true)
    }
    
    func save(){
        let name: String = nameTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        let alert = UIAlertController(title: "Saved", message: "Password saved to KeyChainManager successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        do{
            try KeyChainManager.save(service: "facebook.com", account: name, password: password.data(using: .utf8) ?? Data())
        }catch{
            if(type(of: error) == KeyChainManager.KeychainError.self){
                let alert = UIAlertController(title: "Error", message: "Your data has been saved already!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                present(alert, animated: true)
            }
            
        }
        label.text = "Password: \(password)"
        present(alert, animated: true)
    }
    
    func getPassword(name: String){
        guard let data = KeyChainManager.get(service: "facebook.com", account: name)
        else{
            print("Failed to read password")
            return
        }
        let password = String(decoding: data, as: UTF8.self)
        label.text = "Your password: \(password)"
    }

}

class KeyChainManager{
    
    enum KeychainError: Error{
        case duplicateEntry
        case unknown(OSStatus)
    }
    
    static func save(
        service: String,
        account: String,
        password: Data
    ) throws{
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String : service as AnyObject,
            kSecAttrAccount as String : account as AnyObject,
            kSecValueData as String : password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateEntry
        }
         
        guard status == errSecSuccess else{
            throw KeychainError.unknown(status)
        }
        
        print("saved")
    }
    
    static func get(
        service: String,
        account: String
    ) -> Data?{
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String : service as AnyObject,
            kSecAttrAccount as String : account as AnyObject,
            kSecReturnData as String : kCFBooleanTrue,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        print("Read Status: \(status)")
        
        return result as? Data
    }
}
