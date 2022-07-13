//
//  CFestivalApp.swift
//  CFestival
//
//  Created by zhashut on 2022/6/17.
//

import SwiftUI

@main
struct CFestivalApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
              .environmentObject(ModelData())
        }
    }
}
