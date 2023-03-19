// 찜 - 찜 목록 셀

import UIKit

class WishCollectionViewCell: UICollectionViewCell {
    
    weak var  wishCellDelegate : WishCollectionViewCellDelegate?
    
    @IBOutlet var wishView: UIView!
    @IBOutlet var cafeImg: UIImageView!
    
    @IBOutlet var cafeName: UILabel!
    @IBOutlet var cafeLocal: UILabel!
    
    @IBOutlet var wishBtn: UIButton!
    
    @IBAction func wishBtnClicked(_ sender: UIButton) {
        wishCellDelegate?.wishBtnClicked(sender)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

protocol WishCollectionViewCellDelegate : AnyObject {
    func wishBtnClicked(_ sender: UIButton)
}
