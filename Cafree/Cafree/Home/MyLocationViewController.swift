//
//  MyLocationViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/04.
//
import UIKit
import CoreLocation
class MyLocationViewController: UIViewController, CLLocationManagerDelegate,MTMapViewDelegate {

    var mapView: MTMapView!
    
    var locationManager: CLLocationManager!
   
    
    //경도 위도
    var la: Double!
    var lo: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView = MTMapView(frame: self.view.frame)
        mapView.delegate = self
        mapView.baseMapType = .standard
        mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.4044, longitude: 126.8918)), zoomLevel: 4, animated: true)
        self.view.addSubview(mapView)
        
        locationManager = CLLocationManager()
        
        locationManager.delegate = self
        
        //경도위도 저장
        la = locationManager.location?.coordinate.latitude
        lo = locationManager.location?.coordinate.longitude
        
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        //let myLocate = MTMapPOIItem()
        
        //myLocate.itemName = "ME"
        //myLocate.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: la, longitude: lo))
        //myLocate.markerType = .bluePin
        
        // 현재 위치 트래킹
        mapView.showCurrentLocationMarker = true
        mapView.currentLocationTrackingMode = .onWithoutHeading
        
    }
    
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation], didChangeAuthorization status: CLAuthorizationStatus) {
        let location: CLLocation = locations[locations.count - 1]
        let longtitude: CLLocationDegrees = location.coordinate.longitude
        let latitude:CLLocationDegrees = location.coordinate.latitude
        
        //현재 위치를 한글로 변환하는 과정.
        let LocationNow = CLLocation(latitude: la, longitude: lo)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        
        geocoder.reverseGeocodeLocation(LocationNow,preferredLocale: locale, completionHandler: {(placemarks, error) in if let address:[CLPlacemark] = placemarks {
            if let country: String = address.last?.country {print(country)}
            if let administrativeArea: String = address.last?.administrativeArea {print(administrativeArea)}
            if let locality: String = address.last?.locality {print(locality)}
            if let name: String = address.last?.name {print(name)}
        }
        })
        
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
    
    // Custom: 현 위치 트래킹 함수
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        let currentLocation = location?.mapPointGeo()
        if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude{
            print("MTMapView updateCurrentLocation (\(latitude),\(longitude)) accuracy (\(accuracy))")
        }
    }
    
    func mapView(_ mapView: MTMapView?, updateDeviceHeading headingAngle: MTMapRotationAngle) {
        print("MTMapView updateDeviceHeading (\(headingAngle)) degrees")
    }
}
