//
//  Profile.swift
//  CFestival
//
//  Created by zhashut on 2022/6/17.
//

import Foundation
import SwiftUI

struct Profile {
    var username: String
    var photo: UIImage
    var bgColor: Color = Color(red: 18 / 255, green: 51 / 255, blue: 122 / 255)
    var location: String = "China"
    var goalDate = Date()

    static let `default` = Profile(username: "zhashut", photo: UIImage(named: "头像")!)

}
