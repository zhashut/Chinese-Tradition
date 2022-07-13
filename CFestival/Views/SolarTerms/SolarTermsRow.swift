//
//  SolarTermsRow.swift
//  CFestival
//
//  Created by yu cui on 2022/6/27.
//

import SwiftUI

struct SolarTermsRow: View {
    var solarTerm: SolarTerms
    
    var body: some View {
        HStack(spacing: 12.0) {
          Image(solarTerm.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
            .background(Color.white)
            .cornerRadius(20)

          VStack(alignment: .leading) {
            HStack {
              Text(solarTerm.title)
                .font(.headline)

              Spacer()

              if solarTerm.isFavorite {
                Image(systemName: "star.fill")
                  .foregroundColor(.yellow)
              }
            }

            Text(solarTerm.text)
              .lineLimit(2) // 设置总共显示两行
              .lineSpacing(4) // 设置行间距
              .font(.subheadline)
              .frame(height: 50)

            Text(solarTerm.date)
              .font(.caption)
              .fontWeight(.bold)
              .foregroundColor(.gray)
          }
        }
    }
}

struct SolarTermsRow_Previews: PreviewProvider {
    static var previews: some View {
        SolarTermsRow(solarTerm: SolarTermsData().allSolarTerms()[0])
    }
}
