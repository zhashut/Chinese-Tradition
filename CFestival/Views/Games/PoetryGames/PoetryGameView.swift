//
//  PoetryGameView.swift
//  CFestival
//
//  Created by 李婉玲 on 2022/7/8.
//

import SwiftUI

struct PoetryGameView: View {
    @State var selectedPoetry: poetryGame
    @Environment(\.dismiss) var dismiss // 环境变量

    var body: some View {
        switch selectedPoetry {
        case .元日:
            SpringPoetryGame()
        case .清明:
            QingmPoetryGame()
        case .九月九日忆山东兄弟:
            ChongyPoetryGame()
        case .默认:
            VStack {
                HStack {
                    Button {
                        backgroundMusic?.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("开发小弟正在连夜赶进度.....")
                        .font(.headline)
                }
                Spacer()
            }
        }
    }
}

struct PoetryGameView_Previews: PreviewProvider {
    static var previews: some View {
        PoetryGameView(selectedPoetry: .默认)
    }
}
