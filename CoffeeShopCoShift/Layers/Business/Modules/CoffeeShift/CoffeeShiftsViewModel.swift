//
//  CoffeeShiftsViewModel.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

final class CoffeeShiftsViewModel {
  
  let coffeeShiftsService: CoffeeShiftsServiceProtocol
  var updateUI: () -> Void = { }
  var title = "Coffee Co Shifts"
  
  var viewModels = [CoffeeShiftCellViewModel]() {
    didSet {
      updateUI()
    }
  }
  
  init(
    coffeeShiftsService: CoffeeShiftsServiceProtocol = CoffeeShiftsService()
  ) {
    self.coffeeShiftsService = coffeeShiftsService
    getShifts()
  }
  
  func getShifts() {
    coffeeShiftsService.fetchShifts { [weak self] result in
      switch result {
      case .success(let coffeeShifts):
        guard let self = self, let shifts = coffeeShifts?.coffeeShifts else { return }
        let sortedShifts = shifts.sorted { $0.startDate! > $1.startDate! }
        self.viewModels = sortedShifts.compactMap(CoffeeShiftCellViewModel.init)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  func modelFor(indexPath: IndexPath) -> CoffeeShiftCellViewModel {
    return viewModels[indexPath.row]
  }
}
