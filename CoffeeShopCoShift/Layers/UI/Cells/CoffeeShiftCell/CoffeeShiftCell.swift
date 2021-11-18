//
//  CoffeeShiftCell.swift
//  CoffeeShopCoShift
//
//  Created by Afsal Mohammed on 11/18/21.
//

import UIKit

class CoffeeShiftCell: UITableViewCell {
  
  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    colorView.round()
  }
}


