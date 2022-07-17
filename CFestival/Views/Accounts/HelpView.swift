//
//  HelpView.swift
//  CFestival
//
//  Created by yu cui on 2022/7/1.
//

import SwiftUI

struct HelpView: View {
    var email: String = "2105798885@qq.com"
    var text: String = "作者正在拼命制作中....."
    @State private var showAlert: Bool = false

    var body: some View {
        List {
            Text("反馈问题,请给我发送邮箱,感谢您！")
                .listRowSeparator(.hidden)
            HStack {
                Text("📮 " + email)
                Spacer()
                Button {
                    copyText(from: email)
                    showAlert = true
                } label: {
                    Image(systemName: "doc.on.doc")
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("复制成功")
                    )
                }
            }
            
            Divider()
            
            Text("如何获取源码？")
                .listRowSeparator(.hidden)
            HStack {
                Image(systemName: "location.fill")
                Text("https://github.com/2105798885/Chinese-Tradition.git")
            }
            
            Divider()
            
            Text("更多的传统知识什么时候上线?")
                .listRowSeparator(.hidden)
            HStack {
                Image(systemName: "signature")
                Text(text)
                    .foregroundColor(.primary)
            }
            
            Divider()
        }
        .listStyle(.insetGrouped)
    }
    
    func copyText(from text: String) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = text
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
