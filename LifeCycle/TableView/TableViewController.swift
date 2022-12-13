//
//  TableViewController.swift
//  LifeCycle
//
//  Created by Admin on 30/09/22.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    struct Sunset {
        let title: String
        let imageName: String
    }
    
    let data: [Sunset] = [
        Sunset(title: "Morning Photo", imageName: "1"),
        Sunset(title: "Nature Photo", imageName: "2"),
        Sunset(title: "Vacation Photo", imageName: "3"),
        Sunset(title: "Visiting Forest", imageName: "4"),
        Sunset(title: "Summer Photo", imageName: "5"),
        Sunset(title: "Winter Photo", imageName: "6"),
        Sunset(title: "Spring Photo", imageName: "7"),
        Sunset(title: "Autumn Photo", imageName: "8"),
        Sunset(title: "Morning Photo", imageName: "1"),
        Sunset(title: "Nature Photo", imageName: "2"),
        Sunset(title: "Vacation Photo", imageName: "3"),
        Sunset(title: "Visiting Forest", imageName: "4"),
        Sunset(title: "Summer Photo", imageName: "5"),
        Sunset(title: "Winter Photo", imageName: "6"),
        Sunset(title: "Spring Photo", imageName: "7"),
        Sunset(title: "Autumn Photo", imageName: "8"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
    }
}
extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.label.text = sunset.title
        cell.iconImageView.image = UIImage(named: sunset.imageName)
        return cell
    }
}
