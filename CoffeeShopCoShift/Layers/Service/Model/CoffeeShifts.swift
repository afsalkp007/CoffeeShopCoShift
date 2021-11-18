//
//  CoffeeShifts.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

struct CoffeeShifts {
  var coffeeShifts: [Shift]?
}

extension CoffeeShifts: Codable {
  enum CodingKeys: String, CodingKey {
    case coffeeShifts = "shifts"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    coffeeShifts = try container.decodeValueIfPresent(forKey: .coffeeShifts)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(coffeeShifts, forKey: .coffeeShifts)
  }
  
  static func make(data: Data) -> CoffeeShifts? {
    return try? JSONDecoder().decoder.decode(CoffeeShifts.self, from: data)
  }
}
