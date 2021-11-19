//
//  Color.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

enum Color: String, Codable {
  case red
  case blue
  case green
  
  var value: UIColor {
    switch self {
    case .red: return .red
    case .blue: return .blue
    case .green: return .green
    }
  }
}
