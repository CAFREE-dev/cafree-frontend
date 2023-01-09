//
//  ProfileTabViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/26.
//

import UIKit

class ProfileTabViewController: UIViewController {

    // 사용자 프로필 닉네임
    @IBOutlet var nameLabel: UILabel!
    
    // 사용자 프로필 사진
    @IBOutlet var profileImg: UIImageView!
    
    // 게시글, 좋아요 라벨 (고정)
    @IBOutlet var postLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    
    // 게시글, 좋아요 개수
    @IBOutlet var postCount: UILabel!
    @IBOutlet var likeCount: UILabel!
    
    // 사용자 프로필 수정 버튼
    @IBOutlet var editBtn: UIButton!
    
    // 게시물-좋아요 분류 세그먼트
    @IBOutlet var sortSegment: UISegmentedControl!
    
    // 게시물-좋아요 grid 뷰
    @IBOutlet var gridView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationBarColor()
        
        // 프로필 초기화 
        initProfile()
        initEditBtn()
        
    }
    
    func initProfile() {
        nameLabel.text = "한수빈"

        postLabel.text = "게시글"
        likeLabel.text = "좋아요"
        
        postCount.text = "20"
        likeCount.text = "20"
    }
    
    func initEditBtn() {
        editBtn.setTitle("프로필 수정", for: .normal)
        editBtn.setTitleColor(.white, for: .normal)
        
        editBtn.layer.borderWidth = 0.5
        editBtn.layer.borderColor = UIColor.secondary?.cgColor
        editBtn.layer.cornerRadius = 4
    }
    

    // 내비게이션 바 초기화
    func initNavigationBarColor() {
        // 내비게이션 바 색상 변경
        let navigationBarAppearance = UINavigationBarAppearance() // navigationBar 를 설정해줘야 스크롤 했을 때 색상이 안 보임.
        navigationBarAppearance.backgroundColor = .primary
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
//    @IBAction func touchEditBtn(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "ProfileEditViewController", bundle: nil)
//        let profileEditVC: ProfileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController") as! ProfileEditViewController
//        profileEditVC.modalPresentationStyle = .fullScreen//전체화면(기본은 팝업형태)
//        self.navigationController?.pushViewController(profileEditVC, animated: true)
//        
//    }
//    

}
