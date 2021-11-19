//
//  CreateShiftCoordinator.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

final class CreateShiftCoordinator: Coordinator {
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = CreateShiftViewController.instantiate()
    vc.viewModel = CreateShiftViewModel()
    navigationController.pushViewController(vc, animated: true)
  }
}
