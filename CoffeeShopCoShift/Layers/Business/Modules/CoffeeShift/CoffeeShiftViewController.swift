//
//  CoffeeShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

class CoffeeShiftViewController: UIViewController, Storyboarded, UpdateViewProtocol {
  
  var viewModel: CoffeeShiftsViewModel?
  var coordinator: CreateShiftCoordinator?
  private let adapter = Adapter<CoffeeShiftCellViewModel, CoffeeShiftCell>()
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(cellType: CoffeeShiftCell.self)
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Shift", style: .done, target: self, action: #selector(addShift))
    viewModel?.updateUI = { [weak self] in
      guard let self = self, let viewModel = self.viewModel else { return }
      self.title = viewModel.title
      self.adapter.items = viewModel.viewModels
      self.configureTableView()
    }
  }
  
  func updateView(_ items: [CoffeeShiftCellViewModel]) {
    self.adapter.items = items
    self.configureTableView()
  }
  
  @objc func addShift() {
    let vc = CreateShiftViewController.instantiate()
    vc.delegate = self
    vc.adapter = adapter
    vc.viewModel = CreateShiftViewModel()
    navigationController?.pushViewController(vc, animated: true)
  }
  
  private func configureTableView() {
    adapter.cellHeight = 40.0
    tableView.delegate = adapter
    tableView.dataSource = adapter
    tableView.layer.cornerRadius = 0
    tableView.backgroundColor = UIColor.clear
    tableView.tableFooterView = UIView()
    tableView.reloadData()
    
    adapter.configure = { item, cell in
      cell.nameLabel.text = item.name
      cell.timeLabel.text = item.time
      cell.colorView.backgroundColor = item.color.value
    }
  }
}


