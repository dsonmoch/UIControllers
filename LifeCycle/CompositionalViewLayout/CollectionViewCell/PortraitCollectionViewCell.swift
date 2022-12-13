//
//  PortraitCollectionViewCell.swift
//  LifeCycle
//
//  Created by Admin on 07/10/22.
//

import UIKit

class PortraitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setup(_ item: ListItem){
        cellImageView.image = UIImage(named: item.image)
        cellImageView.contentMode = .scaleToFill
        cellImageView.layer.cornerRadius = 8
        cellImageView.layer.masksToBounds = true
        cellTitleLabel.text = item.title
    }
}
