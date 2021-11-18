//
//  UITableView+Ext.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

extension UITableView {
  func dequeue<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
    return dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
  }
  
  func register(cellType: UITableViewCell.Type) {
    let nib = UINib(nibName: String(describing: cellType), bundle: nil)
    register(nib, forCellReuseIdentifier: String(describing: cellType))
  }
}
