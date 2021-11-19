//
//  UIViewController+Ext.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

extension UIViewController {
  func createColorPopUp(with title: String, label: UILabel) {
    let alert = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
    Color.allCases.forEach { color in
      alert.addAction(UIAlertAction(title: color.rawValue, style: .default) {  _ in
        label.text = color.rawValue
      })
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    self.present(alert, animated: true, completion: nil)
  }
  
  func createEmployeePopUp(with title: String, label: UILabel) {
    let alert = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
    Employee.allCases.forEach { color in
      alert.addAction(UIAlertAction(title: color.rawValue, style: .default) {  _ in
        label.text = color.rawValue
      })
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    self.present(alert, animated: true, completion: nil)
  }
  
  func createRolePopUp(with title: String, label: UILabel) {
    let alert = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
    Role.allCases.forEach { color in
      alert.addAction(UIAlertAction(title: color.rawValue, style: .default) {  _ in
        label.text = color.rawValue
      })
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    self.present(alert, animated: true, completion: nil)
  }
}
