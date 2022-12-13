//
//  QLViewController.swift
//  LifeCycle
//
//  Created by Admin on 28/09/22.
//

import UIKit
import QuickLook

class QLViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let bundle = Bundle.main
        let path = bundle.path(forResource: "Small", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        return url as QLPreviewItem
    }
    
    @IBAction func displayPreview(_ sender: Any) {
        let preview = QLPreviewController()
        
        preview.dataSource = self
        self.present(preview, animated: true, completion: nil)
        
    }
    
}
