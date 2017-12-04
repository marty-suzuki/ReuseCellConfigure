//
//  RightCollectionViewCell.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木大貴 on 2016/01/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import ReuseCellConfigure

final class RightCollectionViewCell: UICollectionViewCell, ReusableViewProtocol, CollectionViewCellProtocol {
    typealias RegisterType = RegisterNib

    @IBOutlet weak var alphabetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addCornerRadius(40)
    }
}
