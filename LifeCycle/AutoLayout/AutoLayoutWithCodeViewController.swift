//
//  AutoLayoutAndAnimationViewController.swift
//  LifeCycle
//
//  Created by Admin on 10/10/22.
//

import UIKit

class AutoLayoutWithCodeViewController: UIViewController {
    var arrColor = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrColor = [.fColor,.sColor,.tColor,.foColor,.fiColor,.fidColor,.firColor,.fibColor,.figColor,.fieColor,
                    .fColor,.sColor,.tColor,.foColor,.fiColor,.fidColor,.firColor,.fibColor,.figColor,.fieColor]
        setupTableView()
    }
    
    private func setupTableView(){
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AutoLayoutTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension AutoLayoutWithCodeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AutoLayoutTableViewCell
        cell.cardView.backgroundColor = arrColor[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
//        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        UIView.animate(withDuration: 1.0, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
//            cell.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
}

extension UIColor{
    static let fColor = UIColor.init(red: 255/255, green: 89/255, blue: 94/255, alpha: 1)
    static let sColor = UIColor.init(red: 255/255, green: 292/255, blue: 58/255, alpha: 1)
    static let tColor = UIColor.init(red: 138/255, green: 201/255, blue: 38/255, alpha: 1)
    static let foColor = UIColor.init(red: 25/255, green: 136/255, blue: 196/255, alpha: 1)
    static let fiColor = UIColor.init(red: 106/255, green: 76/255, blue: 147/255, alpha: 1)
    static let firColor = UIColor.init(red: 106/255, green: 76/255, blue: 147/255, alpha: 1)
    static let fibColor = UIColor.init(red: 255/255, green: 292/255, blue: 58/255, alpha: 1)
    static let figColor = UIColor.init(red: 138/255, green: 201/255, blue: 38/255, alpha: 1)
    static let fidColor = UIColor.init(red: 25/255, green: 136/255, blue: 196/255, alpha: 1)
    static let fieColor = UIColor.init(red: 106/255, green: 76/255, blue: 147/255, alpha: 1)
}
