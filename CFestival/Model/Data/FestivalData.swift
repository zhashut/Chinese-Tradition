//
//  FestivalData.swift
//  CFestival
//
//  Created by yu cui on 2022/7/2.
//

import Foundation

class FestivalData {
    // 类型方法
    static func shared() -> FestivalData {
        return FestivalData()
    }
    
    // 文件路径
    func fileURL() -> URL {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let fileURL = documentURL.appendingPathComponent("festivalData.plist")
        return fileURL
    }

    // 持久化数据
    func save(_ festival: [Festival]) -> Bool {
        guard let data = try? PropertyListEncoder().encode(festival) else {
            return false
        }
        guard let _ = try? data.write(to: fileURL()) else {
            return false
        }
        return true
    }


    // 获取持久化数据
    func allFestivals() -> [Festival] {
        guard let data = try? Data(contentsOf: fileURL()) else {
            return festivalData
        }
        guard let festivals = try? PropertyListDecoder().decode([Festival].self, from: data) else {
            return []
        }
        return festivals
    }
}
