//
//  CourseView.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/10.
//

import SwiftUI

struct FestivalCard: View {
    var festival: Festival
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Text(festival.title)
            .font(Font.custom("WenYue_SXSDiaoYuShaoTi_JF", size: 28))
            .fontWeight(.bold)
            .padding(30)
            .lineLimit(4)
            .strockeStyleline(
              firstColor: Color(red: 18 / 255, green: 51 / 255, blue: 122 / 255),
              seconedColor: Color(red: 18 / 255, green: 51 / 255, blue: 122 / 255)
              )
            
          if festival.isFavorite {
            Image(systemName: "star.fill")
              .foregroundColor(.yellow)
              .offset(x: -28, y: -3)
          }
        }

        Text(festival.calendar)
          .font(.subheadline)
          .foregroundColor(.black)
          .offset(x: 30.0, y: -30)

        Spacer()

        Image(festival.image)
          .resizable()
          .renderingMode(.original)
          .aspectRatio(contentMode: .fill)
          .frame(width: 246, height: 150)
          .padding(.bottom, 52)
      }
      .background(colorScheme == .light ? Color.white : Color(red: 232 / 255, green: 230 / 255, blue: 242 / 255))
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: Color("backgroundShadow3"), radius: 20, x: 0, y: 20)
    }
}

struct FestivalCard_Previews: PreviewProvider {
    static var previews: some View {
        FestivalCard(festival: FestivalData().allFestivals()[0])
    }
}
