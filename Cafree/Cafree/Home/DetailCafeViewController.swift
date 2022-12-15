//
//  DetailCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/13.
//

import UIKit

class DetailCafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cafeDetailTableView: UITableView!
    let cellSpacingHeight: CGFloat = 1
    
    
    var receiveItem = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cafeDetailTableView.delegate = self
        cafeDetailTableView.dataSource = self
    }
    
    // Section 당 Row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Section의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 230
        }
        return 210
    }

    // 셀 넣는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    // 데이터 전달 받는 함수
    func receiveItem(_ item: String){
            receiveItem = item
    }

    // 뒤로가기 버튼
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
        print("뒤로가기버튼")
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
