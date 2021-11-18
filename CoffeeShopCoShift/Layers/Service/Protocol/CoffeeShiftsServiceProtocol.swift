//
//  ClassifiedsServiceProtocol.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

protocol CoffeeShiftsServiceProtocol {
  func fetchShifts(_ completion: @escaping (Result<CoffeeShifts?>) -> Void)
}

extension CoffeeShiftsServiceProtocol {
  func fetchShifts(_ completion: @escaping (Result<CoffeeShifts?>) -> Void) { }
}
