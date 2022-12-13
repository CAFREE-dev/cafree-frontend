//
//  CafeTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/06.
//

import UIKit

class CafeTableViewCell: UITableViewCell {

   
    @IBOutlet var cafeImgView: UIImageView!
    @IBOutlet var cafeName: UILabel!
    @IBOutlet var cafeInfo: UILabel!
    @IBOutlet var cafeDist: UILabel!
    @IBOutlet var cafeLocal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cafeImgView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
