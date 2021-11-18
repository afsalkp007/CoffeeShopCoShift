//
//  Coordinator.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation
import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}

extension Coordinator {
  func start() { }
}
