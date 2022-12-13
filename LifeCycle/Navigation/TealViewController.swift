//
//  TealViewController.swift
//  LifeCycle
//
//  Created by Admin on 26/09/22.
//

import UIKit

class TealViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.tintColor = .white
        title = "Navigation"
        print("MainView \(#function)")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MainView \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MainView \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MainView \(#function)")
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("MainView \(#function)")
    }
  override func loadView() {
    super.loadView()
  }

  

}
