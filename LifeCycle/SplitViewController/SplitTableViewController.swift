//
//  SplitTableViewController.swift
//  LifeCycle
//
//  Created by Admin on 29/09/22.
//

import UIKit

class SplitTableViewController: UITableViewController {

    var arrData = [1,2,3,4,5,6,7,8,9]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SplitTableViewCell", for: indexPath) as! SplitTableViewCell
        cell.labelText.text = "\(arrData[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LabelViewController") as! LabelViewController
        vc.strText = "\(arrData[indexPath.row])"
        splitViewController?.showDetailViewController(vc, sender: nil)
    }

}
