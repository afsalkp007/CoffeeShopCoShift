//
//  CoffeeShiftDataService.swift
//  CoffeeShopCoShiftTests
//
//  Created by Afsal Mohammed on 11/19/21.
//

import XCTest
@testable import CoffeeShopCoShift

class CoffeeShiftDataService: XCTestCase {
  
  func testParsing() throws {
    let json: [String: Any] = [
      "role": "Waiter",
      "name": "Anna",
      "start_date": "2018-04-20 9:00:00 -08:00",
      "end_date": "2018-4-20 12:00:00 -08:00",
      "color": "red"
    ]
    
    let data = try JSONSerialization.data(withJSONObject: json, options: [])
    let decoder = JSONDecoder().decoder
    let shift = try decoder.decode(Shift.self, from: data)
    
    XCTAssertEqual(shift.name, "Anna")
    XCTAssertEqual(shift.role, "Waiter")
    XCTAssertEqual(shift.color, "Red".color)
    XCTAssertEqual(shift.startDate, DateFormatter.serverDateTime.date(from: "2018-04-20 9:00:00 -08:00"))
    XCTAssertEqual(shift.endDate, DateFormatter.serverDateTime.date(from: "2018-4-20 12:00:00 -08:00"))
  }
}
