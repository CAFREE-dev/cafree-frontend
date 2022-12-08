//
//  TitleTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/08.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet var titleImg: UIImageView!
    
    @IBOutlet var titleName1: UILabel!
    
    @IBOutlet var titleName2: UILabel!
    
    @IBOutlet var btnLocal: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
