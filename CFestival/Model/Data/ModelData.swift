//
//  ModelData.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/15.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var profiles = Profile.default
    @Published var favoritears: [FavoriteAR] = favoritearData
    @Published var poetrys: [Poetry] = poetryData
}



