//
//  WebEdit.swift
//  CFestival
//
//  Created by zhashut on 2022/6/21.
//

import SwiftUI

struct WebEdit: View {

  // 传递Web数据的属性
    var passWeb: Web?

  // 与UI控件绑定的属性
  @State private var webNameText: String = ""
  @State private var urlText: String = ""

  // 环境变量
  @Environment(\.dismiss) var dismiss

  // 获取持久化的Web数组
  @State var allWebs: [Web] = WebData.shared().allWebs()

    var body: some View {
      VStack(alignment: .leading) {
          Text("webName".uppercased())
          TextField("输入网址名称", text: $webNameText)

          Text("url".uppercased())
          TextField("输入网址", text: $urlText)

          Spacer()
      }
      .textFieldStyle(.roundedBorder)
      .padding()
      .onAppear {
          if let passWeb = passWeb {
            webNameText = passWeb.webname
            urlText = passWeb.url
          }
      }
      .navigationTitle("修改网址信息")
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              Button {
                  // 修改
                  if let passWeb = passWeb {
                    let newWeb = Web(
                      webname: webNameText,
                      url: urlText
                    )
                      let index = allWebs.firstIndex(where: { web in
                          web.id == passWeb.id
                      })

                      if let index = index {
                        allWebs[index] = newWeb
                      }
                  }
                // 持久性保存
                let success = WebData.shared().save(allWebs)
                if success {
                    print("修改成功")
                }
                else {
                    print("修改失败")
                }
                // 自动回退
                dismiss()
            } label: {
                Text("Save")
            }
          }
      }

    }
}

struct WebEdit_Previews: PreviewProvider {
    static var previews: some View {
      WebEdit(passWeb: WebData().allWebs()[0])

    }
}
