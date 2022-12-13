//
//  LandscapeCollectionViewCell.swift
//  LifeCycle
//
//  Created by Admin on 07/10/22.
//

import UIKit

class LandscapeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setup(_ item: ListItem){
        cellImageView.image = UIImage(named: item.image)
        cellTitleLabel.text = item.title
    }
}
