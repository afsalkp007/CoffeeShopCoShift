//
//  String+Ext.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

extension String {
  var color: UIColor {
    switch self {
    case "red":
      return .red
    case "blue":
      return .blue
    case "green":
      return .green
    default:
      return .clear
    }
  }
}
