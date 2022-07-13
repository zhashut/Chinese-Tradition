//
//  SolarTermsOnly.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/15.
//

import Foundation


var updates = SolarTermsData.shared().allSolarTerms()

var springTerms: [SolarTerms] {
  updates.filter { update in
    update.season == .spring
  }
}

var summerTerms: [SolarTerms] {
  updates.filter { update in
    update.season == .summer
  }
}

var autumnTerms: [SolarTerms] {
  updates.filter { update in
    update.season == .autumn
  }
}

var winterTerms: [SolarTerms] {
  updates.filter { update in
    update.season == .winter
  }
}

