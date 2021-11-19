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
    
  }
  
  @objc
  func startDate(_ sender: UIDatePicker) {
    print(DateFormatter.displayDateTime.string(from: sender.date))
  }
  
  @objc
  func endDate(_ sender: UIDatePicker) {
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
    let alert = UIAlertController(title: "", message: "Select Employee", preferredStyle: .actionSheet)
    
    alert.addAction(UIAlertAction(title: "Anna", style: .default) { [weak self] _ in
      self?.empolyeeLabel.text = "Anna"
    })
    
    alert.addAction(UIAlertAction(title: "Anton", style: .default ) { [weak self] _ in
      self?.empolyeeLabel.text = "Anton"
    })
    
    alert.addAction(UIAlertAction(title: "Eugene", style: .default) { [weak self] _ in
      self?.empolyeeLabel.text = "Eugene"
    })
    
    alert.addAction(UIAlertAction(title: "Keyvan", style: .default) { [weak self] _ in
      self?.empolyeeLabel.text = "Keyvan"
    })
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    self.present(alert, animated: true, completion: nil)
  }
  
  private func showRoles() {
    let alert = UIAlertController(title: "", message: "Select Role", preferredStyle: .actionSheet)
    
    alert.addAction(UIAlertAction(title: "Waitress", style: .default) { [weak self] _ in
      self?.roleLabel.text = "Waitress"
    })
    
    alert.addAction(UIAlertAction(title: "Prep", style: .default ) { [weak self] _ in
      self?.roleLabel.text = "Prep"
    })
    
    alert.addAction(UIAlertAction(title: "Cook", style: .default) { [weak self] _ in
      self?.roleLabel.text = "Cook"
    })
    
    alert.addAction(UIAlertAction(title: "Front of", style: .default) { [weak self] _ in
      self?.roleLabel.text = "Front of"
    })
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    self.present(alert, animated: true, completion: nil)
  }
  
  private func showColors() {
    let alert = UIAlertController(title: "", message: "Select Color", preferredStyle: .actionSheet)
    
    alert.addAction(UIAlertAction(title: "Red", style: .default) { [weak self] _ in
      self?.colorLabel.text = "Red"
    })
    
    alert.addAction(UIAlertAction(title: "Green", style: .default ) { [weak self] _ in
      self?.colorLabel.text = "Green"
    })
    
    alert.addAction(UIAlertAction(title: "Blue", style: .default) { [weak self] _ in
      self?.colorLabel.text = "Blue"
    })
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    self.present(alert, animated: true, completion: nil)
  }
}
