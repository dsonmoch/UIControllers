//
//  HomeViewController.swift
//  LifeCycle
//
//  Created by Admin on 25/10/22.
//

import UIKit
import FirebaseFirestore

class HomeViewController: UIViewController{
    var users = [Users]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        getUsers()
    }
    
    func getUsers(){
        let db = Firestore.firestore()
        db.collection("users")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.users = Users.build(from: querySnapshot?.documents ?? [])
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let users = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        cell.firstName.text = users.firstName
        cell.lastName.text = users.lastName
        return cell
    }
}
