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
    
    var cafes = ["sample1","sample2"]
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
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cafeTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CafeTableViewCell
        let cafe = cafes[indexPath.section]
    
        cell.cafeName.text = cafe
        cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.section+1))
        cell.cafeLocal.text = "sample"
        cell.cafeDist.text = "5.0km"
        cell.cafeInfo.text = "sample"
    
        return cell
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        cafeTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    //지역 버튼 클릭시
    @IBAction func touchBtnLocation(_ sender: UIButton){
        // 뷰 전환
        guard let myLocaionView = self.storyboard?.instantiateViewController(identifier: "MyLocationViewController") else {return}
        self.present(myLocaionView, animated: true)
        
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
