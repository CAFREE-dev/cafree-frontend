//
//  NewCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/05.
//

import UIKit

class NewCafeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

  
    @IBOutlet var newTableView: UITableView!
    
    var cafes = ["garbage"]
    let cellSpacingHeight: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newTableView.delegate = self
        newTableView.dataSource = self
        registerXib()
        
    }
 
    // Section 당 Row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        if cafes.count == 1 {
            return 2
        }else{
            return cafes.count
        }
    }
    
    // 셀 클릭 시 뷰 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 && cafes.count > 1 {
            performSegue(withIdentifier: "showDetailCafe", sender: newTableView.cellForRow(at: indexPath))
        }
    }
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Section의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 190
        }else{
            return 210
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = newTableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell
            cell.titleImg.image = UIImage(named: "titleNewImg")
            cell.titleName1.text = "최근에 새로생긴"
            cell.titleName2.text = "카페를 확인해 보세요!"
            
            return cell
        } else{
            if cafes.count == 1{
                let cell = newTableView.dequeueReusableCell(withIdentifier: "binCell", for: indexPath) as! BinTableViewCell
                cell.binLabel.text = "카페가 없어요."
                
                return cell
            }else{
                let cell = newTableView.dequeueReusableCell(withIdentifier: "cafeCell", for: indexPath) as! CafeTableViewCell
                let cafe = cafes[indexPath.section]
            
                cell.cafeName.text = cafe
                cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.section))
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
        newTableView.register(nibName, forCellReuseIdentifier: "cafeCell")
        
        let nibNameAnother = UINib(nibName: "TitleTableViewCell", bundle: nil)
        newTableView.register(nibNameAnother, forCellReuseIdentifier: "titleCell")
        
        let binNib = UINib(nibName: "BinTableViewCell", bundle: nil)
        newTableView.register(binNib, forCellReuseIdentifier: "binCell")
    }
    
    // 세그웨이를 이용하여 디테일 뷰로 전환하기
    // performSegue랑 연동
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailCafe" {
            let cell = sender as! CafeTableViewCell
            let indexPath = self.newTableView.indexPath(for: cell)
            let detailCafeView = segue.destination as! DetailCafeViewController
            detailCafeView.receiveItem(cafes[((indexPath as NSIndexPath?)?.section)!])
        }
    }
    
}
