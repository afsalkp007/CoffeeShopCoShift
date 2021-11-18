//
//  CoffeeShiftViewController.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

class CoffeeShiftViewController: UIViewController, Storyboarded {
  
  var viewModel: CoffeeShiftsViewModel?
  private let adapter = Adapter<CoffeeShiftCellViewModel, CoffeeShiftCell>()
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(cellType: CoffeeShiftCell.self)
    viewModel?.updateUI = { [weak self] in
      guard let self = self, let viewModel = self.viewModel else { return }
      self.title = viewModel.title
      self.adapter.items = viewModel.viewModels
      self.configureTableView()
    }
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
      cell.colorView.backgroundColor = item.color.color
    }
  }
}

