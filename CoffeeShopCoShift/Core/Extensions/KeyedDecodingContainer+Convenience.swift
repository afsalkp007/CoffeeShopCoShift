//
//  KeyedDecodingContainer+Convenience.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import Foundation

extension KeyedDecodingContainer {
  func decodeValue<T: Decodable>(forKey key: Key) throws -> T {
    try decode(T.self, forKey: key)
  }

  func decodeValueIfPresent<T: Decodable>(forKey key: Key) throws -> T? {
    try decodeIfPresent(T.self, forKey: key)
  }
}

extension JSONDecoder {
  var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .custom { decoder in
      let container = try decoder.singleValueContainer()
      let dateString = try container.decode(String.self)
      if let date = DateFormatter.serverDateTime.date(from: dateString) {
        return date
      }
      throw DecodingError.dataCorruptedError(
        in: container,
        debugDescription: "Cannot decode date string \(dateString)")
    }
    return decoder
  }
}
