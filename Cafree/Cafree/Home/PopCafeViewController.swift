//
//  popCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/05.
//

import UIKit

class PopCafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var btnLocation : UIButton!
    
    @IBOutlet weak var cafeTableView: UITableView!
    
    var cafes = ["garbage","sample1","sample2"]
    let cellSpacingHeight: CGFloat = 1
    
    let cellName = "CafeTableViewCell"
    let cellReuseIdentifier = "cafeCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerXib()
        
        cafeTableView.delegate = self
        cafeTableView.dataSource = self
    }
    
    // Section 당 Row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return cafes.count
    }
    
    // 셀 클릭 시 뷰 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            performSegue(withIdentifier: "showDetailCafe", sender: cafeTableView.cellForRow(at: indexPath))
        }
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
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = cafeTableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell
            cell.titleImg.image = UIImage(named: "titlePopImg")
            cell.titleName1.text = "사람들이 많이 찾는 카페가"
            cell.titleName2.text = "궁금하신가요?"
            
            return cell
        } else{
            let cell = cafeTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CafeTableViewCell
            let cafe = cafes[indexPath.section]
        
            cell.cafeName.text = cafe
            cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.section))
            cell.cafeLocal.text = "sample"
            cell.cafeDist.text = "5.0km"
            cell.cafeInfo.text = "sample"
            
            return cell
        }
        
        //let cell = cafeTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CafeTableViewCell
        //let cafe = cafes[indexPath.section]
    //
        //cell.cafeName.text = cafe
        //cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.section+1))
        //cell.cafeLocal.text = "sample"
        //cell.cafeDist.text = "5.0km"
        //cell.cafeInfo.text = "sample"
    
        //return cell
    }
    
    // 테이블 뷰 셀 레지스터 함수
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        cafeTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
        
        let nibNameAnother = UINib(nibName: "TitleTableViewCell", bundle: nil)
        cafeTableView.register(nibNameAnother, forCellReuseIdentifier: "titleCell")
        
    }
    
    //지역 버튼 클릭시
    @IBAction func touchBtnLocation(_ sender: UIButton){
        // 뷰 전환
        guard let myLocaionView = self.storyboard?.instantiateViewController(identifier: "MyLocationViewController") else {return}
        self.present(myLocaionView, animated: true)
        
    }
    
    // 세그웨이를 이용하여 디테일 뷰로 전환하기
    // performSegue랑 연동
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailCafe" {
            let cell = sender as! CafeTableViewCell
            let indexPath = self.cafeTableView.indexPath(for: cell)
            let detailCafeView = segue.destination as! DetailCafeViewController
            detailCafeView.receiveItem(cafes[((indexPath as NSIndexPath?)?.section)!])
        }
    }
}

//extension PopCafeViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cafes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = cafeTableView.dequeueReusableCell(withIdentifier: "cafeCell") as! CafeTableViewCell
//        let cafe = cafes[indexPath.row]
//
//        cell.cafeName.text = cafe
//        cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.row+1))
//
//        return cell
//    }
//}
