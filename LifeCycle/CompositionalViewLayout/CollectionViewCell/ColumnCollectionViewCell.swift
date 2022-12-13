//
//  CollectionViewCell.swift
//  LifeCycle
//
//  Created by Admin on 10/10/22.
//

import UIKit

class ColumnCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    func setup(_ item: ListItem){
        cellImageView.image = UIImage(named: item.image)
        cellTitleLabel.text = item.title
    }
}
