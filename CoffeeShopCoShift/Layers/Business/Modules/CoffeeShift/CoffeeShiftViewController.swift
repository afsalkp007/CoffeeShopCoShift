//
//  CoffeeShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

class CoffeeShiftViewController: UIViewController, Storyboarded {
  
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
  
  @objc func addShift() {
    coordinator?.start()
  }
  
  private func configureTableView() {
    adapter.cellHeight = 55.0
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


