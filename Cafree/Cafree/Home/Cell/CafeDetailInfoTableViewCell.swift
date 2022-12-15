//
//  CafeDetailInfoTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/15.
//

import UIKit

class CafeDetailInfoTableViewCell: UITableViewCell {

    @IBOutlet var cafeName: UILabel!
    
    @IBOutlet var cafeScore: UILabel!
    
    @IBOutlet var cafeInfo: UILabel!
    
    @IBOutlet var cafeShareBtn: UIButton!
    
    @IBOutlet var backGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backGroundView.layer.cornerRadius = 10
        cafeInfo.numberOfLines = 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
