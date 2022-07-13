//
//  GeocoderTool.swift
//  CFestival
//
//  Created by zhashut on 2022/6/19.
//

import Foundation
import CoreLocation

class GeocoderTool {
    // 地理编码对象
    let geocoder = CLGeocoder()
    
    // 对地理信息编码
    func geocoderAddress(_ address: String, completion:@escaping ([CLLocationCoordinate2D]?) -> Void) {
        // 对地理信息字符串进行编码
        geocoder.geocodeAddressString(address) { placemarks, error in
            // 如果错误，返回nil，并结束
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            // 判断 placemarks 数组不为空
            guard let placemarks = placemarks else {
                completion(nil)
                return
            }
            // 获取placemarks数组中每一个 PlaceMark 对象，并取出对象的 coordinate 属性，做成新的数组
            let coordinates: [CLLocationCoordinate2D] = placemarks.compactMap { place in
                place.location?.coordinate
            }
            completion(coordinates)
        }
    }

    // 对经纬度反向编码
//    func reverseGeocoderCoordinate(_ coor: CLLocationCoordinate2D, completion:@escaping (String?) -> Void) {
//        // 对地理经纬度信息进行反向编码
//        geocoder.reverseGeocodeLocation(CLLocation(latitude: coor.latitude, longitude: coor.longitude)) { places, error in
//            // 如果错误
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil)
//                return
//            }
//            // palces为空
//            guard let places = places else {
//                completion(nil)
//                return
//            }
//            // 提取places数组中每个PlaceMark对象，取出地址字符串，并构成新数组
//            let addresses: [String] = places.compactMap { place in
//                place.name
//            }
//
//          let result: String = addresses[addresses.count - 1]
//            completion(result)
//        }
//    }
    
    // 对经纬度反向编码
    func reverseGeocoderCoordinate(_ coor: CLLocationCoordinate2D, completion:@escaping ([String]?) -> Void) {
        // 对地理经纬度信息进行反向编码
        geocoder.reverseGeocodeLocation(CLLocation(latitude: coor.latitude, longitude: coor.longitude)) { places, error in
            // 如果错误
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            // palces为空
            guard let places = places else {
                completion(nil)
                return
            }
            // 提取places数组中每个PlaceMark对象，取出地址字符串，并构成新数组
            let addresses: [String] = places.compactMap { place in
                place.name
            }
            completion(addresses)
        }
    }
    
}
