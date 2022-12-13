//
//  PopoverViewController.swift
//  LifeCycle
//
//  Created by Admin on 28/09/22.
//

import UIKit

class YellowViewController: UIViewController {

   
    @IBAction func displayPopover(_ sender: UIBarButtonItem) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PopoverViewController")
            vc.modalPresentationStyle = .popover
            let popover: UIPopoverPresentationController = vc.popoverPresentationController!
            popover.barButtonItem = sender
            present(vc, animated: true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Popover"
    }
    
}
