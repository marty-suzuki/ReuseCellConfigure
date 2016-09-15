//
//  LeftIconTableViewCell.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木 大貴 on 2016/01/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class LeftIconTableViewCell: UITableViewCell, TableViewCellProtocol {

    @IBOutlet weak var alphabetLabel: UILabel!
    fileprivate var color: UIColor?
    fileprivate var inverseColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addCornerRadius(30)
    }
    
    func randomBackgoundColor() {
        if color == nil {
            color = UIColor(red: randValue(), green: randValue(), blue: randValue(), alpha: 1)
        }
        contentView.backgroundColor = color
        
        if inverseColor == nil {
            var value: (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            color?.getRed(&value.0, green: &value.1, blue: &value.2, alpha: &value.3)
            inverseColor = UIColor(red: 1-value.0, green: 1-value.1, blue: 1-value.2, alpha: value.3)
        }
        alphabetLabel.backgroundColor = inverseColor
        alphabetLabel.textColor = color
    }
    
    fileprivate func randValue() -> CGFloat {
        return CGFloat(arc4random() % 255) / 255
    }
}
