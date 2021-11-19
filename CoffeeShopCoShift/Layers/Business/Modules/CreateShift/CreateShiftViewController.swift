//
//  CreateShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

class CreateShiftViewController: UIViewController, Storyboarded {
  
  var viewModel: CreateShiftViewModel?
  @IBOutlet weak var startDatePicker: UIDatePicker!
  @IBOutlet weak var endDatePicker: UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel?.title
    navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Shifts")
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
    startDatePicker?.addTarget(self, action: #selector(startDate(_ :)), for: .valueChanged)
    endDatePicker?.addTarget(self, action: #selector(endDate(_ :)), for: .valueChanged)

  }
  
  @objc func save() {
    
  }
  
  @objc func startDate(_ sender: UIDatePicker) {
    print(DateFormatter.displayDateTime.string(from: sender.date))
  }
  
  @objc func endDate(_ sender: UIDatePicker) {
    print(DateFormatter.displayDateTime.string(from: sender.date))
  }
}
