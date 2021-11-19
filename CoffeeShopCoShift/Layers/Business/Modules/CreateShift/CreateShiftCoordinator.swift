//
//  CreateShiftCoordinator.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

final class CreateShiftCoordinator: Coordinator {
  var navigationController: UINavigationController
  let coffeeShiftViewController = CoffeeShiftViewController()
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = CreateShiftViewController.instantiate()
    vc.delegate = coffeeShiftViewController
    vc.viewModel = CreateShiftViewModel()
    navigationController.pushViewController(vc, animated: true)
  }
}
