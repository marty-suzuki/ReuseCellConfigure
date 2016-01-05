//
//  LeftCollectionViewCell.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木大貴 on 2016/01/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class LeftCollectionViewCell: UICollectionViewCell, CollectionViewCellProtocol {
    @IBOutlet weak var alphabetLabel: UILabel!
    private var color: UIColor?
    private var inverseColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addCornerRadius(40)
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
    
    private func randValue() -> CGFloat {
        return CGFloat(random() % 255) / 255
    }
}
