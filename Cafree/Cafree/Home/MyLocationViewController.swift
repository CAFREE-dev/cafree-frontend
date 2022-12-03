//
//  MyLocationViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/04.
//
import UIKit
import CoreLocation
class MyLocationViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager = CLLocationManager()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
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
    
}
