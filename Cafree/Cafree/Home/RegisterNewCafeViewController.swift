//
//  RegisterNewCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/30.
//

import UIKit
import CoreLocation

class RegisterNewCafeViewController: UIViewController, MTMapViewDelegate {

    @IBOutlet var newCafeMapView: UIView!
    
    @IBOutlet var registerNewCafeTextField: UITextField!
    
    
    var mapView: MTMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 검색필드 디자인
        registerNewCafeTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: registerNewCafeTextField.frame.size.height-1, width: registerNewCafeTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        registerNewCafeTextField.layer.addSublayer((border))
        registerNewCafeTextField.textColor = UIColor.black
        
        registerNewCafeTextField.addLeftPadding()
        registerNewCafeTextField.addleftimage(image: UIImage(named: "searchIconGray")!)
        
        // 카카오 맵 받아오기
        mapView = MTMapView(frame: newCafeMapView.frame)
        mapView.delegate = self
        mapView.baseMapType = .standard
        mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.4044, longitude: 126.8918)), zoomLevel: 4, animated: true)
        
        newCafeMapView.addSubview(mapView)
        mapView.bounds = CGRect(x: newCafeMapView.frame.size.height, y: -50, width: newCafeMapView.frame.size.width, height: newCafeMapView.frame.size.height)
        
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
