//
//  PoetryData.swift
//  CFestival
//
//  Created by zhashut on 2022/7/7.
//

import Foundation

enum poetryGame: String, CaseIterable, Identifiable {
    case 元日, 清明, 九月九日忆山东兄弟, 默认
    var id: Self { self }
}

struct Poetry: Identifiable {
    var id = UUID()
    var poetryName: String
    var poetryWriter: String
    var resultPoetry: String
    var game: poetryGame
    var isVictory: Bool
}

let poetryData = [
    Poetry(poetryName: "元日", poetryWriter: "〔宋〕王安石", resultPoetry: "千门万户瞳瞳日总把新桃换旧符", game: .元日, isVictory: false),
    Poetry(poetryName: "清明", poetryWriter: "〔唐〕杜 牧", resultPoetry: "借问酒家何处有牧童遥指杏花村", game: .清明, isVictory: false),
    Poetry(poetryName: "九月九日忆山东兄弟", poetryWriter: "〔唐〕王 维", resultPoetry: "遥知兄弟登高处遍插茱萸少一人", game: .九月九日忆山东兄弟, isVictory: false),
    Poetry(poetryName: "敬请期待！", poetryWriter: "更多的诗词背诵游戏还没有结束哦！", resultPoetry: "", game: .默认, isVictory: false)
]

let cuijie = ["户", "万", "旧", "日", "总", "符", "桃", "门", "瞳", "把", "换", "千", "新"]
let qingm = ["问", "童", "酒", "指", "家", "有", "借", "牧", "杏", "何", "遥", "处", "花", "村"]
let chongy = ["萸", "兄", "遥", "登", "处", "少", "知", "人", "弟", "一", "高", "插", "茱", "遍"]

