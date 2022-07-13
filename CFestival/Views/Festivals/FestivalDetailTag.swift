//
//  PickerView.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/12.
//

import SwiftUI

struct FestivalDetailTag: View {
    @State private var selectedCatalog: Catalog = .简介
    @State var allFestivals: [Festival] = FestivalData.shared().allFestivals()
    var festival: Festival

    var synopsis = FestivalData.shared().allFestivals()[0].festivalContent.synopsis
    var origin = FestivalData.shared().allFestivals()[0].festivalContent.origin
    var custom = FestivalData.shared().allFestivals()[0].festivalContent.custom
    var poetry = FestivalData.shared().allFestivals()[0].festivalContent.poetry
    var contentImag = FestivalData.shared().allFestivals()[0].image

  var festivalIndex: Int {
      allFestivals.firstIndex(where: { $0.id == festival.id })!
  }
    
    // 点击收藏按钮触发的闭包
    var saveCompletion: (() -> Void)?


    var body: some View {
      VStack {
          FavoriteButton(isSet: $allFestivals[festivalIndex].isFavorite) {
              _ = FestivalData.shared().save(allFestivals)
              if let saveCompletion = saveCompletion {
                    // 调用闭包函数
                    saveCompletion()
                }
          }
          
        Picker("Catalog", selection: $selectedCatalog) {
          ForEach(Catalog.allCases) { catalog in
            Text(catalog.rawValue.capitalized)
          }
        }
        .pickerStyle(.segmented)
        
        Spacer()

        switch selectedCatalog {
        case .简介:
          SynopsisView(
            synopsis: synopsis,
            contentImag: contentImag
          )
        case .起源:
          OriginView(
            origin: origin,
            contentImag: contentImag
          )
        case .习俗:
          CustomView(
            custom: custom,
            contentImag: contentImag
          )
        case .诗歌:
          PoetryView(
            poetry: poetry,
            contentImag: contentImag
          )
        }
      }
    }
}

struct FestivalContentTag_Previews: PreviewProvider {
    static var previews: some View {
        FestivalDetailTag(festival:FestivalData().allFestivals()[0])
    }
}
