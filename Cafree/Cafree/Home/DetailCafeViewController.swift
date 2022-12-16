//
//  DetailCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/13.
//

import UIKit
import CoreLocation

class DetailCafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MTMapViewDelegate {

    @IBOutlet weak var cafeDetailTableView: UITableView!
    let cellSpacingHeight: CGFloat = 1
    
    var mapView: MTMapView!
    
    
    //데이터 받아오는 변수
    var receiveItem = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerXib()
        
        cafeDetailTableView.delegate = self
        cafeDetailTableView.dataSource = self
        
        cafeDetailTableView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        
        
        
    }
    
    // Section 당 Row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Section의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 420
        }
        return 110
    }

    // 셀 넣는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = cafeDetailTableView.dequeueReusableCell(withIdentifier: "detailInfoCell", for: indexPath) as! CafeDetailInfoTableViewCell
            cell.cafeName.text = receiveItem
            cell.cafeInfo.text = "카페 상세 정보, 설명 라벨입니다. 2줄을 테스트 하기 위해 길게 씁니다."
            cell.cafeScore.text = String(3.0)+"점"
            cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
            return cell
        } else {
            let cell = cafeDetailTableView.dequeueReusableCell(withIdentifier: "detailLocalCell", for: indexPath) as! CafeDetailLocalTableViewCell
            
            mapView = MTMapView(frame: cell.mapView.frame)
            mapView.delegate = self
            mapView.baseMapType = .standard
            mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.4044, longitude: 126.8918)), zoomLevel: 4, animated: true)
            
            cell.mapView.addSubview(mapView)
            
            
            cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
            return cell
        }
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

    
    // 테이블 뷰 셀 레지스터 함수
    private func registerXib() {
        let nibDetailInfo = UINib(nibName: "CafeDetailInfoTableViewCell", bundle: nil)
        cafeDetailTableView.register(nibDetailInfo, forCellReuseIdentifier: "detailInfoCell")
        
        let nibDetailLocal = UINib(nibName: "CafeDetailLocalTableViewCell", bundle: nil)
        cafeDetailTableView.register(nibDetailLocal, forCellReuseIdentifier: "detailLocalCell")
    }
    
    //맵뷰
    func mapView(_ mapView: MTMapView?, updateDeviceHeading headingAngle: MTMapRotationAngle) {
        print("MTMapView updateDeviceHeading (\(headingAngle)) degrees")
    }
}
