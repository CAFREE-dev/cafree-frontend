//
//  WishTableViewCell.swift
//  Cafree
//
//  Created by νμλΉ on 2022/12/25.
//

import UIKit

class WishCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var wishView: UIView!
    @IBOutlet var cafeImg: UIImageView!
    
    @IBOutlet var cafeName: UILabel!
    @IBOutlet var cafeLocal: UILabel!
    
    @IBOutlet var wishBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
