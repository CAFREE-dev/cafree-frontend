//
//  BinTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/29.
//

import UIKit

class BinTableViewCell: UITableViewCell {

    @IBOutlet var binLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
