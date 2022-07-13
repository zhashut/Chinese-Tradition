//
//  FavoriteView.swift
//  CFestival
//
//  Created by zhashut on 2022/6/22.
//

import Foundation
import SwiftUI

enum Favorited: String, CaseIterable, Identifiable {
  case 节日, 节气
  var id: Self { self }
}

struct FavoriteView: View {
  @State private var selectedFavorite: Favorited = .节日
    
  var body: some View {
    VStack {
      Picker("Favorite", selection: $selectedFavorite) {
        ForEach(Favorited.allCases) { favorite in
          Text(favorite.rawValue.capitalized)
        }
      }
      .pickerStyle(.segmented)

      Spacer()

      switch selectedFavorite {
      case .节日:
        FestivalFavorite()
      case .节气:
        SolarTermsFavorite()
      }

    }

  }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
          .environmentObject(ModelData())
    }
}
