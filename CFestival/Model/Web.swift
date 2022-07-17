//
//  Web.swift
//  CFestival
//
//  Created by zhashut on 2022/6/21.
//

import Foundation

struct Web: Identifiable, Codable {
  var id = UUID()
  var webname: String
  var url: String
}

let webData = [
    Web(webname: "MyGithub", url: "https://github.com/2105798885")
]
