//
//  CircleButton.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/11.
//

import SwiftUI

struct CircleButton: View {
  var icon = "person.crop.circle"

    var body: some View {
      HStack {
        Image(systemName: icon)
//          .foregroundColor(.primary)
      }
      .frame(width: 45, height: 45)
      .background(Color("button"))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton()
    }
}
