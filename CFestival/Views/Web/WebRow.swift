//
//  WebRow.swift
//  CFestival
//
//  Created by zhashut on 2022/6/21.
//

import SwiftUI

struct WebRow: View {
  var web: Web

    var body: some View {

        Link(destination: URL(string: web.url)!) {
          HStack {
            Label(web.webname, systemImage: "house")
            Spacer()
            Image(systemName: "link")
              .foregroundColor(.primary)
          }
        }

    }
}

struct WebRow_Previews: PreviewProvider {
    static var previews: some View {
      WebRow(web: WebData().allWebs()[0])
    }
}
