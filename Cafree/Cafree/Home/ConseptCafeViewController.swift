//
//  ConseptCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/05.
//

import UIKit

class ConseptCafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var conseptTableView: UITableView!
    
    var cafes = ["garbage", "sample1"]
    let cellSpacingHeight: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        conseptTableView.delegate = self
        conseptTableView.dataSource = self
        registerXib()
        
    }
 
    // Section 당 Row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        if cafes.count == 1 {
            return 3
        }else{
            return cafes.count + 1
        }
    }
    
    // 셀 클릭 시 뷰 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 1 && cafes.count > 1 {
            performSegue(withIdentifier: "showDetailCafe", sender: conseptTableView.cellForRow(at: indexPath))
        }
    }
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Section의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        else if indexPath.section == 1 {
            return 44
        }
        else{
            return 210
        }
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = conseptTableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell
            cell.titleImg.image = UIImage(named: "titleConseptImg")
            cell.titleName1.text = "다양한 테마의"
            cell.titleName2.text = "카페를 확인해 보세요!"
            
            return cell
            
        } else if indexPath.section == 1{
            let cell = conseptTableView.dequeueReusableCell(withIdentifier: "conseptCell", for: indexPath) as! ConseptTableViewCell
            
            return cell
            
        }else{
            if cafes.count == 1{
                let cell = conseptTableView.dequeueReusableCell(withIdentifier: "binCell", for: indexPath) as! BinTableViewCell
                cell.binLabel.text = "카페가 없어요."
                
                return cell
            } else {
                let cell = conseptTableView.dequeueReusableCell(withIdentifier: "cafeCell", for: indexPath) as! CafeTableViewCell
                let cafe = cafes[indexPath.section - 1]
            
                cell.cafeName.text = cafe
                cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.section-1))
                cell.cafeLocal.text = "sample"
                cell.cafeDist.text = "5.0km"
                cell.cafeInfo.text = "sample"
                
                return cell
            }
        }
        
    }
    // 테이블 뷰 셀 레지스터 함수
    private func registerXib() {
        let nibName = UINib(nibName: "CafeTableViewCell", bundle: nil)
        conseptTableView.register(nibName, forCellReuseIdentifier: "cafeCell")
        
        let nibNameAnother = UINib(nibName: "TitleTableViewCell", bundle: nil)
        conseptTableView.register(nibNameAnother, forCellReuseIdentifier: "titleCell")
        
        let binNib = UINib(nibName: "BinTableViewCell", bundle: nil)
        conseptTableView.register(binNib, forCellReuseIdentifier: "binCell")
        
        let conseptNib = UINib(nibName: "ConseptTableViewCell", bundle: nil)
        conseptTableView.register(conseptNib, forCellReuseIdentifier: "conseptCell")
    }
    
    // 세그웨이를 이용하여 디테일 뷰로 전환하기
    // performSegue랑 연동
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailCafe" {
            let num : Int!
            num = 1
            let cell = sender as! CafeTableViewCell
            let indexPath = self.conseptTableView.indexPath(for: cell)
            let detailCafeView = segue.destination as! DetailCafeViewController
            detailCafeView.receiveItem(cafes[((indexPath as NSIndexPath?)?.section)!-num])
        }
    }
}
