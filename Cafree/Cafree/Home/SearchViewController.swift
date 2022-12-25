//
//  SearchViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/19.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchField: UITextField!
    
    @IBOutlet var backBtn: UIBarButtonItem!
    @IBOutlet var searchBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: searchField.frame.size.height-1, width: searchField.frame.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        searchField.layer.addSublayer((border))
        searchField.textColor = UIColor.black
        
        searchField.addLeftPadding()
        searchField.addleftimage(image: UIImage(named: "searchIconGray")!)
        
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
        print("뒤로가기 버튼")
    }
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        print(searchField.text!+" 검색하기")
    }
    override func viewDidLayoutSubviews() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//텍스트 필드 커스텀
extension UITextField {

    //텍스트 필드 앞에 페딩 넣기
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    //텍스트 필드 앞에 이미지 넣기
    func addleftimage(image:UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        leftimage.image = image
        self.leftView = leftimage
        self.leftViewMode = .always
    }

}
