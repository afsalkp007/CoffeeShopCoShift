//
//  CreateShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

class CreateShiftViewController: UIViewController, Storyboarded {
  
  var viewModel: CreateShiftViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
  }
  
  @objc func save() {
    
  }
}
