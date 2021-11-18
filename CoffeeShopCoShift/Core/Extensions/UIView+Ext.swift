//
//  UIView+Ext.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

extension UIView {
  func round() {
    layer.cornerRadius = frame.height / 2
    layer.masksToBounds = true
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1.0
  }
}
