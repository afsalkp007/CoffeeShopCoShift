//
//  CoffeeShiftCoordinator.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

final class CoffeeShiftCoordinator: Coordinator {
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = CoffeeShiftViewController.instantiate()
    vc.viewModel = CoffeeShiftsViewModel()
    navigationController.pushViewController(vc, animated: false)
  }
}
