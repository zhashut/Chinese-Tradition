//
//  UpdateLIst.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/10.
//

import SwiftUI

struct SolarTermsList: View {
    @State var selectedSeason: Season = .defaultStatus
    @State private var showSolarTermsOnly = false
    @State var allSolarTerms: [SolarTerms] = []

  var filteredSolarTerms: [SolarTerms] {
      allSolarTerms.filter { solarTerm in
          if selectedSeason == .defaultStatus {
              return (!showSolarTermsOnly || solarTerm.isFavorite)
          }
          else {
              return (!showSolarTermsOnly || solarTerm.isFavorite) && solarTerm.season == selectedSeason
          }
        }
    }

    var body: some View {
        NavigationView {
          List {
            Toggle(isOn: $showSolarTermsOnly) {
              Text(showSolarTermsOnly ? "收藏节气" : "所有节气")
            }

            ForEach(filteredSolarTerms) { item in
              NavigationLink {
                SolarTermsDetail(solarTerms: item)
              } label: {
                SolarTermsRow(solarTerm: item)
              }
              .padding(.vertical, 8.0)
            }
          }
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing)  {
              Picker("Season", selection: $selectedSeason) {
                ForEach(Season.allCases) { seanson in
                  Text(seanson.rawValue.capitalized)
                }
              }
              .pickerStyle(.menu)
            }
          }
          .navigationTitle("二十四节气")
          .onAppear {
              allSolarTerms = SolarTermsData.shared().allSolarTerms()
          }
            
            // 这个详情只会在iPad运行App时显示，用iPhone运行时不显示
            SolarTermsDetail(solarTerms: SolarTermsData.shared().allSolarTerms()[0])
            
            
        }
    }
}

struct UpdateLIst_Previews: PreviewProvider {
    static var previews: some View {
            SolarTermsList()
    }
}
