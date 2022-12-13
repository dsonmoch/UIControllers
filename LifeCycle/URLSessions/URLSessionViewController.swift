//
//  URLSessionViewController.swift
//  LifeCycle
//
//  Created by Admin on 19/10/22.
//

import UIKit

class URLSessionViewController: UIViewController{
    
    var users = [UserData]()
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Users"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapEdit))
        getUsersHandler()
    }
    
    @objc private func didTapEdit(){
        let alert = UIAlertController(title: "New User", message: "Enter new User", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter Name"
        }
        alert.addTextField { UITextField in
            UITextField.placeholder = "Enter Job"
        }
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let nameField = alert.textFields?[0], let name = nameField.text, !name.isEmpty else{
                return
            }
            guard let jobField = alert.textFields?[1], let job = jobField.text, !job.isEmpty else{
                return
            }
            self?.createUserHandler(name: name, job: job)
        }))
        
        present(alert, animated: true)
    }
    
    
    func getUsersHandler(){
        var url = URLRequest(url: URL(string: Endpoint.getUsers)!)
        url.httpMethod = "get"
        getUsersApiCall(url: url)
    }
    
    func createUserHandler(name: String, job: String){
        let validator = URLSessionValidator()
        if(validator.validateCreateUserInput(name: name, job: job)){
           let urlRequest = createUserRequestBodyBuilder(name: name, job: job)
            createUserApiCall(urlRequest: urlRequest, name: name,job: job)
        }else{
            let alert = UIAlertController(title: "Error", message: "Check Name and Email field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    func deleteUserHandler(){
        var urlRequest = URLRequest(url: URL(string: Endpoint.createUser)!)
        urlRequest.httpMethod = "delete"
        deleteUserApiCall(urlRequest: urlRequest)
    }
}

extension URLSessionViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modal = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = modal.firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let alert = UIAlertController(title: "User Details", message: "First Name: \(user.firstName) \n Last Name: \(user.lastName) \n email: \(user.email)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}

extension URLSessionViewController{
    
    func createUserRequestBodyBuilder(name: String, job: String) -> URLRequest{
        var urlRequest = URLRequest(url: URL(string: Endpoint.createUser)!)
        urlRequest.httpMethod = "post"
        
        let dataDictionary = [
            "name": "",
            "job": ""
        ]
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }
        catch{
            print("Error Encoding to Json")
        }
        return urlRequest
    }
    
    func getUsersApiCall(url: URLRequest){
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else{return}
            do{
                let jsonDataModels = try JSONDecoder().decode(Response.self, from: data)
                self.users = jsonDataModels.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print("Failed to decode!")
            }
            
        }
        task.resume()
    }
    
    func createUserApiCall(urlRequest: URLRequest, name: String, job: String){
        URLSession.shared.dataTask(with: urlRequest) { data, httpUrlResponse, error in
            DispatchQueue.main.async {
            if(data != nil && data?.count != 0){
                do{
                    let response = try JSONDecoder().decode(CreateUserResponse.self, from: data!)
                    let alert = UIAlertController(title: "Success", message: "User created Successfully! \n Name: \(response.name) \n Job: \(response.job) \n Create At: \(response.createdAt)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    
                        self.present(alert, animated: true)
                }catch{
                    print("Failed to decode data!")
                }
                
                }
            }
        }.resume()
    }
    
    func deleteUserApiCall(urlRequest: URLRequest){
        URLSession.shared.dataTask(with: urlRequest) { data, httpUrlResponse, error in
            DispatchQueue.main.async {
            if(error == nil){
                let alert = UIAlertController(title: "Success", message: "User Deleted", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }.resume()
    }
}
