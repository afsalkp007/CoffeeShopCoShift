//
//  Shift.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

struct Shift {
  var role: String
  var name: String
  var startDate: Date?
  var endDate: Date?
  var color: String
}

extension Shift: Codable {
  enum CodingKeys: String, CodingKey {
    case role
    case name
    case startDate = "start_date"
    case endDate = "end_date"
    case color
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    role = try container.decodeValue(forKey: .role)
    name = try container.decodeValue(forKey: .name)
    startDate = try container.decodeValue(forKey: .startDate)
    endDate = try container.decodeValue(forKey: .endDate)
    color = try container.decodeValue(forKey: .color)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(role, forKey: .role)
    try container.encode(name, forKey: .name)
    try container.encode(startDate, forKey: .startDate)
    try container.encode(endDate, forKey: .endDate)
    try container.encode(color, forKey: .color)
  }
}


