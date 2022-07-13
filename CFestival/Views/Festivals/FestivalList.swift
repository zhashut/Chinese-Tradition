//
//  mainList.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/10.
//

import SwiftUI

struct FestivalList: View {
    @State var showContent = false
    @State var selectItem: Festival = FestivalData().allFestivals()[0]
    @State private var showFavoritesOnly = false
    var voicebroadcast = Voicebroadcast()
    @Environment(\.colorScheme) var colorScheme
    @State var allFestivals: [Festival] = []

    var filterFestivals: [Festival] {
          allFestivals.filter { festival in
          (!showFavoritesOnly || festival.isFavorite)
        }
    }

    var body: some View {
      ScrollView {
        VStack {
          HStack {
            VStack(alignment: .leading) {
              Text("传统节日")
                .font(.system(size: 45))
                .fontWeight(.heavy)
                  .strockeStyleline(
                    firstColor: Color(red: 246 / 255, green: 146 / 255, blue: 61 / 255),
                    seconedColor: Color(red: 252 / 255, green: 212 / 255, blue: 127 / 255)
                  )
              Toggle(isOn: $showFavoritesOnly) {
                Text(showFavoritesOnly ? "取消显示" : "显示收藏节日")
              }
              .toggleStyle(.button)
            }
            Spacer()
          }
          .padding(.leading, 60)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30.0) {
              ForEach(filterFestivals) { item in
                  if selectItem.id == UUID() {
                      
                  }
                Button(action: {
                    selectItem = item
                    self.showContent.toggle()
                }) {
                  GeometryReader { geometry in
                    FestivalCard(festival: item)
                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                  }
                  .frame(width: 246, height: 360)
                }
              }
            }
            .sheet(isPresented: $showContent) {
                FestivalDetailTag(
                    festival: selectItem,
                  synopsis: selectItem.festivalContent.synopsis,
                  origin: selectItem.festivalContent.origin,
                  custom: selectItem.festivalContent.custom,
                  poetry: selectItem.festivalContent.poetry,
                    contentImag: selectItem.image) {
                        allFestivals = FestivalData.shared().allFestivals()
                    }
            }
            .padding(.leading, 30)
            .padding(.top, 30 )
            .padding(.bottom, 70)

            Spacer()
          }
        }
        .padding(.top, 78)
      }
      .onAppear {
          allFestivals = FestivalData.shared().allFestivals()
      }
      .background(
        Image(colorScheme == .light ? "FavoriteBackground" : "暗黑背景")
          .resizable()
      )
    }
}

struct FestivalList_Previews: PreviewProvider {
    static var previews: some View {
        FestivalList()
    }
}
