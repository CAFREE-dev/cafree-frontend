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
    
    @IBOutlet var cafeAdressLabel: UILabel!
    
    @IBOutlet var copyAdressBtn: UIButton!
    
    var delegate: CafeDetailLocalTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backGroundView.layer.cornerRadius = 10
    }

    @IBAction func clickedCopyAdressBtn(_ sender: Any) {
        UIPasteboard.general.string = cafeAdressLabel.text
        self.delegate?.copyAdress()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
protocol CafeDetailLocalTableViewCellDelegate: AnyObject {
    func copyAdress()
}
