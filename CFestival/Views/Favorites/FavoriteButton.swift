//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by zhashut on 2022/6/4.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var saveCompletion: (() -> Void)?

    
    var body: some View {
        Button {
            isSet.toggle()
            if let saveCompletion = saveCompletion {
                  // 调用闭包函数
                  saveCompletion()
              }
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                // 只显示图标，不显示标签内容
                .labelStyle(.iconOnly)
                // 设置不同状态下的颜色
                .foregroundColor(isSet ? .yellow : .gray)
                .font(.system(size: 22))
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
