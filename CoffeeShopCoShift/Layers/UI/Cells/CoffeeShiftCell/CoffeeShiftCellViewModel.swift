//
//  CoffeeShiftCellViewModel.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

struct CoffeeShiftCellViewModel {
  var name: String
  var color: String
  var time: String
  
  init(shift: Shift) {
    let dayMonth = DateFormatter.monthDate.string(from: shift.startDate ?? Date())
    let start = DateFormatter.tweleveHour.string(from: shift.startDate!)
    let end = DateFormatter.tweleveHour.string(from: shift.endDate!)
    self.name = "\(shift.name) (\(shift.role)) \(dayMonth)"
    self.color = shift.color
    self.time = "\(start)-\(end)"
  }
}
