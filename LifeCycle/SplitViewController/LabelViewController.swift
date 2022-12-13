//
//  LabelViewController.swift
//  LifeCycle
//
//  Created by Admin on 29/09/22.
//

import UIKit

class LabelViewController: UIViewController {


    @IBOutlet weak var labelNumber: UILabel!
    var strText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNumber.text = strText
    }

}
