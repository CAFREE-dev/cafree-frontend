//
//  RegisterCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/30.
//

import UIKit

class RegisterCafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var searchCafeTextField: UITextField!
    
    @IBOutlet var registerTableView: UITableView!
    
    var cafes : [String] = []
    let cellSpacingHeight: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        searchCafeTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: searchCafeTextField.frame.size.height-1, width: searchCafeTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        searchCafeTextField.layer.addSublayer((border))
        searchCafeTextField.textColor = UIColor.black
        
        searchCafeTextField.addLeftPadding()
        searchCafeTextField.addleftimage(image: UIImage(named: "searchIconGray")!)
        
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerXib()
        
    }
    
    // Section 당 Row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return cafes.count + 1
    }
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Section의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == cafes.count{
            let cell = registerTableView.dequeueReusableCell(withIdentifier: "registerBtnCell", for: indexPath) as! RegisterBtnTableViewCell
            
            return cell
        }else {
            let cell = registerTableView.dequeueReusableCell(withIdentifier: "registerBtnCell", for: indexPath) as! RegisterBtnTableViewCell
            
            return cell
        }
        
    }
    // 테이블 뷰 셀 레지스터 함수
    private func registerXib() {
        let nibName = UINib(nibName: "RegisterBtnTableViewCell", bundle: nil)
        registerTableView.register(nibName, forCellReuseIdentifier: "registerBtnCell")

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


