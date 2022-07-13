//
//  SolarTermsFavorite.swift
//  CFestival
//
//  Created by zhashut on 2022/6/22.
//

import SwiftUI

struct SolarTermsFavorite: View {
    @State var selectedSeason: Season = .defaultStatus
    @State private var showSolarTermsOnly = true
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
        }
    }
}

struct SolarTermsFavorite_Previews: PreviewProvider {
    static var previews: some View {
        SolarTermsFavorite()
    }
}
