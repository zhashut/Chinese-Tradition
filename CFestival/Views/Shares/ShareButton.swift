//
//  ShareButton.swift
//  CFestival
//
//  Created by zhashut on 2022/6/19.
//

import SwiftUI

struct ShareButton: View {
  @State var showActivityControllerView: Bool = false
  @State var detailImag: UIImage
    var body: some View {
      Button {
        self.showActivityControllerView.toggle()
      } label: {
        Text("分享")
              .foregroundColor(.blue)
      }
      .sheet(isPresented: $showActivityControllerView) {
        UIKitActivityControllerView(activityItems: [detailImag])
      }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(detailImag: UIImage())
    }
}
