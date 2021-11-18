//
//  CoffeeShiftsService.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}

final class CoffeeShiftsService: CoffeeShiftsServiceProtocol {
  private let networking: Networking
  
  init(networking: Networking = NetworkService()) {
    self.networking = networking
  }
  
  /// Fetch classifieds data
  /// - Parameter completion: Called when operation finishes
  func fetchShifts(_ completion: @escaping (Result<CoffeeShifts?>) -> Void) {
    let resource = Resource(url: Constants.Urls.BaseUrl, path: "v1/e12f48e4-6b30-4d27-9b3d-e03320556557")
    _ = networking.fetch(resource: resource, completion: { data in
      DispatchQueue.main.async {
        completion(.success(data.flatMap({ CoffeeShifts.make(data: $0) }) ))
      }
    })
  }
}
