//
//  DateFormatter+Format.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

extension DateFormatter {
  private static var base = DateFormatter()
  
  static var serverDateTime: DateFormatter {
    base.withFormat("yyyy-MM-dd HH:mm:ss -HH:mm")
  }
  
  static var monthDate: DateFormatter {
    base.withFormat("EEE, M/dd")
  }
  
  func withFormat(_ format: String) -> DateFormatter {
    dateFormat = format
    return self
  }
}
