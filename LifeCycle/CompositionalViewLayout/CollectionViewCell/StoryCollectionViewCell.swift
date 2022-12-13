//
//  StoryCollectionViewCell.swift
//  LifeCycle
//
//  Created by Admin on 07/10/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setup(_ item: ListItem){
        cellImageView.image = UIImage(named: item.image)
        cellImageView.contentMode = .scaleToFill
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
    
}
