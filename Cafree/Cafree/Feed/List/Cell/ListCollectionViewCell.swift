// 피드(Feed) - 리스트(List) - 리스트 셀

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    var cellDelegate: ListCollectionViewCellDelegate?

    // 프로필 이미지
    @IBOutlet var profileImg: UIImageView!
    
    // 이름
    @IBOutlet var nameLabel: UILabel!
    
    // 게시 날짜
    @IBOutlet var dateLabel: UILabel!
    
    // 더보기 버튼
    @IBOutlet var moreBtn: UIButton!
    
    // 카페 이미지
    @IBOutlet var cafeImg: UIImageView!
    
    // 카페 태그 라벨 2개
    @IBOutlet var tag1Label: UILabel!
    @IBOutlet var tag2Label: UILabel!
    
    // 좋아요 수
    @IBOutlet var likeCount: UILabel!
    
    // 좋아요 버튼
    @IBOutlet var likeBtn: UIButton!
    
    // 카페 이름
    @IBOutlet var cafeName: UILabel!
    
    // 카페 소개
    @IBOutlet var cafeInfo: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
 
    @IBAction func moreBtnClicked(_ sender: UIButton) {
        self.cellDelegate?.moreBtnClicked()
    }
    
}

protocol ListCollectionViewCellDelegate : AnyObject {
    func moreBtnClicked()
    func likeBtnClicked(_ sender : UIButton)
}
