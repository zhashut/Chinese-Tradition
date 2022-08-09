//
//  LocationView.swift
//  CFestival
//
//  Created by zhashut on 2022/6/19.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
  // 位置处理对象
  let locationTool = LocationTool()
  @State var lat: Double = 0.0
  @State var long: Double = 0.0
  @State var listData: [String] = []     // 列表数据源
  @State var alertMessage: String = ""   // 弹窗显示的信息
  @State var showAlert: Bool = false     // 是否显示弹窗
  @EnvironmentObject var modelData: ModelData

  // Body视图
  var body: some View {
    VStack {
      Button {
        guard locationTool.locationServiceAvaiable() else {
            print("不支持位置服务")
            return
        }
        locationTool.requestAuthorization()
        locationTool.requestCurrentLocation { currentCoor in
            DispatchQueue.main.async {
              lat = currentCoor.latitude
              long = currentCoor.longitude
            }
        }
        GeocoderTool().reverseGeocoderCoordinate(CLLocationCoordinate2D(latitude: lat, longitude: long)) { addresses in
                guard let addresses = addresses else {
                    alertMessage = "定位获取失败！"
                    showAlert.toggle()
                    return
                }
                modelData.profiles.location = addresses
            }
      } label: {
          Image(systemName: "location")
      }
    }
    .alert(alertMessage, isPresented: $showAlert) {}
  }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
      LocationView()
            .environmentObject(ModelData())
    }
}
