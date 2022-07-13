//
//  Content.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/12.
//

import Foundation

// 表示节日内容的结构
struct FestivalContent: Identifiable, Hashable, Codable {
  var id = UUID()
  var synopsis: String
  var origin: String
  var custom: String
  var poetry: String
}

