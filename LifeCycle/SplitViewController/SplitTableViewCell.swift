//
//  SplitTableViewCell.swift
//  LifeCycle
//
//  Created by Admin on 29/09/22.
//

import UIKit

class SplitTableViewCell: UITableViewCell {


    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
