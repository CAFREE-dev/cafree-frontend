//
//  CafeDetailPhotoTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/17.
//

import UIKit

class CafeDetailPhotoTableViewCell: UITableViewCell, UIScrollViewDelegate {

    @IBOutlet var cafeDetailScrollView: UIScrollView!
    @IBOutlet var cafeDetailPageCon: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cafeDetailScrollView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
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
