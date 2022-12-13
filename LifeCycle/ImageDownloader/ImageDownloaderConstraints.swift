//
//  ImageDownloaderUI.swift
//  LifeCycle
//
//  Created by Admin on 21/10/22.
//

import UIKit

extension ImageDownloaderViewController{
    
    func viewImageButtonConstraints(){
        NSLayoutConstraint.init(item: viewImageButton, attribute: .top, relatedBy: .equal, toItem: imageViewContainer, attribute: .top, multiplier: 1, constant: 260).isActive = true
        NSLayoutConstraint.init(item: viewImageButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -70).isActive = true
        NSLayoutConstraint.init(item: viewImageButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 70).isActive = true
        NSLayoutConstraint.init(item: viewImageButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        }
    
    func urlTextFieldConstraints(){
        NSLayoutConstraint.init(item: urlTextField, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint.init(item: urlTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint.init(item: urlTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint.init(item: urlTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
    }
    
    func imageViewContainerConstraints(){
        NSLayoutConstraint.init(item: imageViewContainer, attribute: .top, relatedBy: .equal, toItem: urlTextField, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint.init(item: imageViewContainer, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint.init(item: imageViewContainer, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint.init(item: imageViewContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
    }
}
