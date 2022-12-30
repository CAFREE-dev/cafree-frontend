//
//  CafeDetailPhotoTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/17.
//

import UIKit

protocol ComponentProductCellDelegate {
    func selectedGoodBtn(goodIndex: Int)
    
    func selectedNiceBtn(niceIndex: Int)
}

class CafeDetailPhotoTableViewCell: UITableViewCell, UIScrollViewDelegate {

    @IBOutlet var cafeDetailScrollView: UIScrollView!
    @IBOutlet var cafeDetailPageCon: UIPageControl!
    
    @IBOutlet var cafeScore: UILabel!
    
    @IBOutlet var cafeNice: UIButton!
    
    @IBOutlet var cafeGood: UIButton!
    
    
    var delegate: ComponentProductCellDelegate?
    var goodIndex = 0
    var niceIndex = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cafeDetailScrollView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //
    @IBAction func selectedGoodBtn(_ sender: Any) {
        self.delegate?.selectedGoodBtn(goodIndex: goodIndex)
        
        if goodIndex == 1{
            self.cafeGood.setImage(UIImage(named: "good1"), for: .normal)
            goodIndex = 0
        }else{
            self.cafeGood.setImage(UIImage(named: "good2"), for: .normal)
            goodIndex = 1
        }
    }
    
    @IBAction func selectedNiceBtn(_ sender: Any) {
        self.delegate?.selectedNiceBtn(niceIndex: niceIndex)
        if niceIndex == 1{
            self.cafeNice.setImage(UIImage(named: "nice1"), for: .normal)
            niceIndex = 0
        }else{
            self.cafeNice.setImage(UIImage(named: "nice2"), for: .normal)
            niceIndex = 1
        }
        
    }
    
    //타이틀 이미지 페이지 컨트롤
    //페이지 컨트롤 현재 페이지 설정
    private func setPageControlSelectedPage(currentPage:Int) {
            cafeDetailPageCon.currentPage = currentPage
    }
    //위 함수에게 전달할 현재 스크롤 인덱스
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let value = scrollView.contentOffset.x/scrollView.frame.size.width
            setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
}
