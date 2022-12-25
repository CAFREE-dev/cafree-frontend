//
//  WishTableViewCell.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/25.
//

import UIKit

class WishTableViewCell: UITableViewCell {
    
    @IBOutlet var wishView: UIView!
    @IBOutlet var cafeImg: UIImageView!
    
    @IBOutlet var cafeName: UILabel!
    @IBOutlet var cafeLocal: UILabel!
    
    @IBOutlet var wishBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
