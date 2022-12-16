//
//  CafeDetailLocalTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/16.
//

import UIKit

class CafeDetailLocalTableViewCell: UITableViewCell {

    @IBOutlet var backGroundView: UIView!
    
    @IBOutlet var mapView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backGroundView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
