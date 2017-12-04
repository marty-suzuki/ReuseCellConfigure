//
//  RightIconTableViewCell.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木 大貴 on 2016/01/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import ReuseCellConfigure

final class RightIconTableViewCell: UITableViewCell, ReusableViewProtocol, TableViewCellProtocol {
    typealias RegisterType = RegisterNib

    @IBOutlet weak var alphabetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addCornerRadius(30)
    }
}
