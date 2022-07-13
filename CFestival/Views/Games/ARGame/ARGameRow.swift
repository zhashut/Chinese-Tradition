//
//  ARGameRow.swift
//  CFestival
//
//  Created by zhashut on 2022/6/24.
//

import SwiftUI

struct ARGameRow: View {
    var favoriteRow: FavoriteAR
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12.0) {
                Text(favoriteRow.title)
                    .font(.title2)
                    .strockeStyleline()
                
                Text(favoriteRow.description)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }

            Spacer()
            
            Image(systemName: "chevron.right")
              .font(.system(size: 13))
              .foregroundColor(.secondary)
              .offset(x: 15)
        }
        .background(
            Image(favoriteRow.backgroundImage)
                .resizable()
                .frame(width: 350, height: 95, alignment: .center)
                .cornerRadius(30)
                .aspectRatio(contentMode: .fill)
                .opacity(0.5)
        )
        .padding()
    }
}

struct ARGameRow_Previews: PreviewProvider {
    static var previews: some View {
        ARGameRow(favoriteRow: FavoriteAR(title: "赛龙舟", description: "来近距离观看龙舟比赛吧！", game: .端午, backgroundImage: "牛郎织女"))
    }
}
