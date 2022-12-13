//
//  ModalViewController.swift
//  LifeCycle
//
//  Created by Admin on 18/10/22.
//

import UIKit

class ModalViewController: NotificationViewController, UITableViewDelegate, UITableViewDataSource {
    
    var request = [UNNotificationRequest]()
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ToDo List"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        self.getNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getNotification()
    }
    
    func getNotification() {
        self.notificationCenter.getPendingNotificationRequests(completionHandler: { requests in
            self.request = requests
        })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func deleteNotification(identifier: [String], index: Int){
        self.notificationCenter.removePendingNotificationRequests(withIdentifiers: identifier)
        self.request.remove(at: index)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.request.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.request[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.identifier
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pending Notifications"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = self.request[indexPath.row]
        let alert = UIAlertController(title: "Remove Notification?", message: "Are you sure you want to remove notification", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {_ in
            self.deleteNotification(identifier: [identifier.identifier], index: indexPath.row)
        }))
        present(alert, animated: true)
    }
}
