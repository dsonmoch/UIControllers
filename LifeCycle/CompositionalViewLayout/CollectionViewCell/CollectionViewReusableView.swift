//
//  CollectionViewReusableView.swift
//  LifeCycle
//
//  Created by Admin on 07/10/22.
//

import UIKit

class CollectionViewReusableView: UICollectionReusableView {
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    func setup(_ title: String){
        cellTitleLabel.text = title
    }
        
}
