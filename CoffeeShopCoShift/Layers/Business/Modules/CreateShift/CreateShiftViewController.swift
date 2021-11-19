//
//  CreateShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

protocol UpdateViewProtocol {
  func updateView()
}

class CreateShiftViewController: UIViewController, Storyboarded {
  
  var viewModel: CreateShiftViewModel?
  var coffeeShiftViewModel = CoffeeShiftsViewModel()
  var delegate: UpdateViewProtocol?
  @IBOutlet weak var startDatePicker: UIDatePicker!
  @IBOutlet weak var endDatePicker: UIDatePicker!
  @IBOutlet weak var empolyeeLabel: UILabel!
  @IBOutlet weak var roleLabel: UILabel!
  @IBOutlet weak var colorLabel: UILabel!
  
  var startDate: Date?
  var endDate: Date?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel?.title
    navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Shifts")
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
    startDatePicker?.addTarget(self, action: #selector(startDate(_ :)), for: .valueChanged)
    endDatePicker?.addTarget(self, action: #selector(endDate(_ :)), for: .valueChanged)
    empolyeeLabel.isUserInteractionEnabled = true
    empolyeeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectEmployee)))
    
    roleLabel.isUserInteractionEnabled = true
    roleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectRole)))
    
    colorLabel.isUserInteractionEnabled = true
    colorLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectColor)))
  }
  
  @objc
  func save() {
    guard let role = roleLabel.text,
          let name = empolyeeLabel.text,
          let color = colorLabel.text else { return }
    coffeeShiftViewModel.viewModels.append(CoffeeShiftCellViewModel(name: name, color: color.color, time: ""))
    delegate?.updateView()
    navigationController?.popViewController(animated: true)
  }
  
  @objc
  func startDate(_ sender: UIDatePicker) {
    startDate = sender.date
    print(DateFormatter.displayDateTime.string(from: sender.date))
  }
  
  @objc
  func endDate(_ sender: UIDatePicker) {
    endDate = sender.date
    print(DateFormatter.displayDateTime.string(from: sender.date))
  }
  
  @objc
  func selectColor() {
    showColors()
  }
  
  @objc
  func selectRole() {
    showRoles()
  }
  
  @objc
  func selectEmployee() {
    showEmployess()
  }
  
  private func showEmployess() {
    createEmployeePopUp(with: "Select Employee", label: empolyeeLabel)
  }
  
  private func showRoles() {
    createRolePopUp(with: "Select Role", label: roleLabel)
  }
  
  private func showColors() {
    createColorPopUp(with: "Select Color", label: colorLabel)
  }
}

