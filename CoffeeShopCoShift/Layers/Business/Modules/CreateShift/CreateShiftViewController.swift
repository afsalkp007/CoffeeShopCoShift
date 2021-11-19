//
//  CreateShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/19/21.
//

import UIKit

protocol UpdateViewProtocol {
  func updateView(_ items: [CoffeeShiftCellViewModel])
}

class CreateShiftViewController: UIViewController, Storyboarded {
  
  var adapter: Adapter<CoffeeShiftCellViewModel, CoffeeShiftCell>?
  var viewModel: CreateShiftViewModel?
  var coffeeShiftViewModel = CoffeeShiftsViewModel()
  var delegate: UpdateViewProtocol?
  @IBOutlet weak var startDatePicker: UIDatePicker!
  @IBOutlet weak var endDatePicker: UIDatePicker!
  @IBOutlet weak var empolyeeLabel: UILabel!
  @IBOutlet weak var roleLabel: UILabel!
  @IBOutlet weak var colorLabel: UILabel!
  
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
    updateDataSource()
    navigationController?.popViewController(animated: true)
  }
  
  private func updateDataSource() {
    guard let sRole = roleLabel.text,
          let sName = empolyeeLabel.text,
          let sColor = colorLabel.text else { return }
    let dayMonth = DateFormatter.monthDate.string(from: viewModel?.startDate ?? Date())
    let start = DateFormatter.tweleveHour.string(from: viewModel?.startDate ?? Date())
    let end = DateFormatter.tweleveHour.string(from: viewModel?.endDate ?? Date())
    let name = "\(sName) (\(sRole)) \(dayMonth)"
    let time = "\(start)-\(end)"
    guard let adapter = adapter else { return }
    adapter.items.insert(CoffeeShiftCellViewModel(name: name, color: sColor.color, time: time), at: 0)
    delegate?.updateView(adapter.items)
  }
  
  @objc
  func startDate(_ sender: UIDatePicker) {
    viewModel?.startDate = sender.date
  }
  
  @objc
  func endDate(_ sender: UIDatePicker) {
    viewModel?.endDate = sender.date
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

