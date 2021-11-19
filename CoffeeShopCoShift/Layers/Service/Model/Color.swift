//
//  Color.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

enum Color: String, Codable, CaseIterable {
  case red
  case blue
  case green
  case white
  
  var value: UIColor {
    switch self {
    case .red: return .red
    case .blue: return .blue
    case .green: return .green
    case .white: return .white
    }
  }
}

extension String {
  var color: Color {
    switch self {
    case "red":
      return .red
    case "blue":
      return .blue
    case "green":
      return .green
    default:
      return .white
    }
  }
}
