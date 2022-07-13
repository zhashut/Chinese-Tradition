//
//  LocationTool.swift
//  CFestival
//
//  Created by zhashut on 2022/6/19.
//

import Foundation
import CoreLocation

class LocationTool: NSObject, CLLocationManagerDelegate {
    // MARK: ------ Properties -------
    // 位置管理器属性
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()

    // 地理编码对象
    let geocoder = CLGeocoder()

    // 回传当前位置的闭包
    var locationCompletion: ((CLLocationCoordinate2D) -> Void)?


    // MARK: ------ Methods -------
    // 判断定位服务是否可用
    func locationServiceAvaiable() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }

    // 请求授权
    func requestAuthorization()  {
        locationManager.requestWhenInUseAuthorization()
    }

    // 请求当前位置
    func requestCurrentLocation(completion:@escaping (CLLocationCoordinate2D) -> Void) {
        self.locationCompletion = completion
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    // 地理编码
    func geocoderAddress(_ address: String, completion:@escaping (CLLocationCoordinate2D) -> Void )  {
        geocoder.geocodeAddressString(address) { placeMarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let placeMarks = placeMarks,
            let lastPlace = placeMarks.last,
            let coor = lastPlace.location?.coordinate else {
                return
            }

            completion(coor)
        }
    }

    // MARK: ------ CLLocationManagerDelegate -------
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationCompletion = locationCompletion else {
            return
        }

        guard let currentLoc = locations.last else {
            return
        }

        locationCompletion(currentLoc.coordinate)
    }
}
