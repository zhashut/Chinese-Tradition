//
//  WebData.swift
//  CFestival
//
//  Created by zhashut on 2022/6/21.
//

import Foundation

class WebData {
  // 类型方法
  static func shared() -> WebData {
      return WebData()
  }

  // 文件路径
  func fileURL() -> URL {
      let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
      let fileURL = documentURL.appendingPathComponent("webData.plist")
      return fileURL
  }

  // 持久化数据
  func save(_ web: [Web]) -> Bool {
      guard let data = try? PropertyListEncoder().encode(web) else {
          return false
      }
      guard let _ = try? data.write(to: fileURL()) else {
          return false
      }
      return true
  }


  // 获取持久化数据
  func allWebs() -> [Web] {
      guard let data = try? Data(contentsOf: fileURL()) else {
          return webData
      }
      guard let webs = try? PropertyListDecoder().decode([Web].self, from: data) else {
          return []
      }
      return webs
  }

}
