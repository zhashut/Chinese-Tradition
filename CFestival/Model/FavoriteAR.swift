//
//  FavoriteAR.swift
//  CFestival
//
//  Created by zhashut on 2022/6/24.
//

import Foundation
import SwiftUI

enum ARGame: String, CaseIterable, Identifiable {
    case 春节, 端午, 七夕, 默认
    var id: Self { self }
}

struct FavoriteAR: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var game: ARGame
    var backgroundImage: String
}

let favoritearData = [
    FavoriteAR(title: "赛龙舟", description: "来近距离观看龙舟比赛吧！", game: .端午, backgroundImage: "赛龙舟"),
    FavoriteAR(title: "牛郎织女", description: "了解牛郎织女动人的故事吧!", game: .七夕, backgroundImage: "牛郎织女"),
    FavoriteAR(title: "放烟花", description: "来观赏烟花绽放的美丽吧！", game: .春节, backgroundImage: "放烟花"),
    FavoriteAR(title: "敬请期待！", description: "更多有趣的AR游戏还没有结束哦！", game: .默认, backgroundImage: "")

]
