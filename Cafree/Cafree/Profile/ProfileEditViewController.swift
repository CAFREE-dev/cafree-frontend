// 프로필 - 프로필 수정 버튼 - 프로필 수정

import UIKit

class ProfileEditViewController: UIViewController {
    
    // 프로필 이미지
    @IBOutlet var profileImg: UIImageView!
    
    // 이름(닉네임) 라벨
    @IBOutlet var nameLabel: UILabel!
    
    // 이름(닉네임) 수정 텍스트 필드
    @IBOutlet var nameEditTextField: UITextField!
    
    // 수정사항 저장 버튼
    @IBOutlet var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNameLabel()
        initSaveBtn()
        
    }
    
    func initNameLabel() {
        nameLabel.text = "이름(닉네임)"
        nameLabel.textColor = .black
    }
    
    func initEditTextField(){
        nameEditTextField.textColor = .black
        nameEditTextField.layer.cornerRadius = 4
        nameEditTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func initSaveBtn() {
        saveBtn.setTitle("저장", for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.layer.backgroundColor = UIColor.secondary?.cgColor
        saveBtn.layer.cornerRadius = 4
    }
    
    // 하단 탭바 지우기
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        self.hidesBottomBarWhenPushed = true
//    }
    
}
