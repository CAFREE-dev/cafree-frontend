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
    
    @IBOutlet var niceBtn: UIButton!
    
    var delegate: CafeTableViewCellDelegate?
    
    var niceIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cafeImgView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    @IBAction func clickedNiceBtn(_ sender: Any) {
        self.delegate?.clickedNiceBtn(niceIndex: niceIndex)
        if niceIndex == 1{
            self.niceBtn.setImage(UIImage(named: "nice1"), for: .normal)
            niceIndex = 0
        }else{
            self.niceBtn.setImage(UIImage(named: "nice2"), for: .normal)
            niceIndex = 1
        }
        
    }
    
}
protocol CafeTableViewCellDelegate {
    func clickedNiceBtn(niceIndex: Int)
}
