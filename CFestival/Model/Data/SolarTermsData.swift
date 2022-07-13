//
//  SolarTermsData.swift
//  CFestival
//
//  Created by yu cui on 2022/7/1.
//

import Foundation

class SolarTermsData {
    
    // 类型方法
    static func shared() -> SolarTermsData {
        return SolarTermsData()
    }
    
    // 文件路径
    func fileURL() -> URL {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let fileURL = documentURL.appendingPathComponent("solarTermData.plist")
        return fileURL
    }

    // 持久化数据
    func save(_ solarTerm: [SolarTerms]) -> Bool {
        guard let data = try? PropertyListEncoder().encode(solarTerm) else {
            return false
        }
        guard let _ = try? data.write(to: fileURL()) else {
            return false
        }
        return true
    }


    // 获取持久化数据
    func allSolarTerms() -> [SolarTerms] {
        guard let data = try? Data(contentsOf: fileURL()) else {
            return solarTermsData
        }
        guard let solarTerms = try? PropertyListDecoder().decode([SolarTerms].self, from: data) else {
            return []
        }
        return solarTerms
    }
    
}
