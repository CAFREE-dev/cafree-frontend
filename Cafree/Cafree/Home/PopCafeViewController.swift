//
//  popCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/05.
//

import UIKit
import CoreLocation
import Alamofire

class PopCafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate{
    
    @IBOutlet weak var cafeTableView: UITableView!
    
    var nice = 0
    //위치 매니져
    var locationManager: CLLocationManager!
    
    var cafes = ["garbage"]
    let cellSpacingHeight: CGFloat = 1
    
    let cellName = "CafeTableViewCell"
    let cellReuseIdentifier = "cafeCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerXib()
        
        cafeTableView.delegate = self
        cafeTableView.dataSource = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        getTest()
        
    }
    
    //위치 권한
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    //위치 권한
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation], didChangeAuthorization status: CLAuthorizationStatus) {
        
        //위치권한 alert
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case .denied:
            print("GPS 권한 요청 거무됨")
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
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
            let bounds = UIScreen.main.bounds
            let height = bounds.size.height
            if height == 812.0 {
                return 180
            }else{
                return 190
            }
        }else{
            return 220
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = cafeTableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell
            cell.titleImg.image = UIImage(named: "titlePopImg")
            cell.titleName1.text = "사람들이 많이 찾는 카페가"
            cell.titleName2.text = "궁금하신가요?"
            
            return cell
        } else{
            if cafes.count == 1{
                let cell = cafeTableView.dequeueReusableCell(withIdentifier: "binCell", for: indexPath) as! BinTableViewCell
                cell.binLabel.text = "카페가 없어요."
                
                return cell
            }else{
                let cell = cafeTableView.dequeueReusableCell(withIdentifier: "cafeCell", for: indexPath) as! CafeTableViewCell
                let cafe = cafes[indexPath.section]
                
                cell.delegate = self
                
                cell.cafeName.text = cafe
                cell.cafeImgView.image = UIImage(named: "sampleCafeImg2")
                cell.cafeLocal.text = "sample"
                cell.cafeDist.text = "5.0km"
                cell.cafeInfo.text = "sample"
                
                // 찜 버튼 0 -> 빈칸, 1 -> 빨간색
                if nice == 0{
                    cell.niceBtn.setImage(UIImage(named: "nice1"), for: .normal)
                    cell.niceIndex = 0
                }else{
                    cell.niceBtn.setImage(UIImage(named: "nice2"), for: .normal)
                    cell.niceIndex = 1
                }
                
                return cell
            }
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
        
        let binNib = UINib(nibName: "BinTableViewCell", bundle: nil)
        cafeTableView.register(binNib, forCellReuseIdentifier: "binCell")
    }
    
    ////지역 버튼 클릭시
    //@IBAction func touchBtnLocation(_ sender: UIButton){
    //    // 뷰 전환
    //    guard let myLocaionView = self.storyboard?.instantiateViewController(identifier: "MyLocationViewController") else {return}
    //    self.present(myLocaionView, animated: true)
    //
    //}
    
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
    
    //get 테스트 함수
    func getTest() {
        //https://cafree.net/get/api/v1/cafes
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Cafes.self) { (response) in
                //여기서 가져온 데이터를 자유롭게 활용하세요.
                guard let cafesData = response.value else {return}
                print(cafesData.title)
                self.cafes = ["garbage"]
                self.cafes.append(cafesData.title)
                self.cafes.append(cafesData.title)
                print("성공?")
                self.cafeTableView.reloadData()
        }
    }
}
extension PopCafeViewController: CafeTableViewCellDelegate{
    func clickedNiceBtn(niceIndex: Int) {
        if niceIndex == 0{
            self.nice = 1
        }else{
            self.nice = 0
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
