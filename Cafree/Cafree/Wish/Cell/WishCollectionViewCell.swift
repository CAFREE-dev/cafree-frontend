//
//  WishTableViewCell.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/25.
//

import UIKit

class WishCollectionViewCell: UITableViewCell {
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        wishView.frame = wishView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
