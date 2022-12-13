//
//  CollectionViewCell.swift
//  LifeCycle
//
//  Created by Admin on 29/09/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images: [UIImage] = [
            UIImage(named: "1.jpg"),
            UIImage(named: "2.jpg"),
            UIImage(named: "3.jpg"),
            UIImage(named: "4.jpg"),
            UIImage(named: "5.jpg"),
            UIImage(named: "6.jpg"),
        ].compactMap({$0})
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
        
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
