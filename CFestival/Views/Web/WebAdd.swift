//
//  WebAddAndEdit.swift
//  CFestival
//
//  Created by zhashut on 2022/6/21.
//

import SwiftUI

struct WebAdd: View {

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
      .navigationTitle("添加喜爱的网站")
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              Button {
                  let newWeb = Web(
                    webname: webNameText,
                    url: urlText
                  )
                  allWebs.insert(newWeb, at: 0)
                // 持久性保存
                let success = WebData.shared().save(allWebs)
                if success {
                    print("保存成功")
                }
                else {
                    print("增加失败")
                }
                // 自动回退
                dismiss()
            } label: {
                Text("保存")
            }


          }
      }
    }
}

struct WebAdd_Previews: PreviewProvider {
    static var previews: some View {
      WebAdd(passWeb: WebData().allWebs()[0])
    }
}
