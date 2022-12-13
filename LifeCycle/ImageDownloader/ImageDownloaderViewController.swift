//
//  ImageDownloaderViewController.swift
//  LifeCycle
//
//  Created by Admin on 21/10/22.
//

import UIKit
import SkyFloatingLabelTextField
import Kingfisher

class ImageDownloaderViewController: UIViewController {
    
    var urlTextField: SkyFloatingLabelTextField = {
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Enter URL"
        textField.title = "Enter URL"
        textField.tintColor = overcastBlueColor
        textField.textColor = .darkGray
        textField.lineColor = .lightGray
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 2.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var imageViewContainer: UIView = {
        let theView = UIView()
        theView.layer.cornerRadius = 10
        theView.translatesAutoresizingMaskIntoConstraints = false
        return theView
    }()
    
    var viewImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("View Image", for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(urlTextField)
        self.view.addSubview(imageViewContainer)
        self.view.addSubview(viewImageButton)
        imageViewContainer.isHidden = true
        urlTextFieldConstraints()
        imageViewContainerConstraints()
        viewImageButtonConstraints()
        viewImageButton.addTarget(self, action: #selector(getImage), for: .touchUpInside)
    }

}
