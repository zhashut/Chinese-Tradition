//
//  GameView.swift
//  CFestival
//
//  Created by 李婉玲 on 2022/7/8.
//

import SwiftUI

struct GameView: View {
    var body: some View {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text("AR游戏")
                            .font(.title)
                            
                        ARGameList()
                    }
                }
                .frame(height: 435)
                
                HStack {}
                
                Section {
                    VStack(alignment: .leading) {
                        Text("诗歌游戏")
                            .font(.title)
                        PoetryGameList()
                    }
                }
                .frame(height: 435)
            }
            .listStyle(.inset)
            
            // 这个提示只会在iPad运行App时显示，用iPhone运行时不显示
//                Text("选择一个游戏")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(ModelData())
    }
}
