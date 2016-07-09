//
//  CollectionViewCellProtocol.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木大貴 on 2016/01/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

protocol CollectionViewCellProtocol: class {
    weak var alphabetLabel: UILabel! { get set }
    func addCornerRadius(_ cornerRadius: CGFloat)
}

extension CollectionViewCellProtocol {
    func addCornerRadius(_ cornerRadius: CGFloat) {
        alphabetLabel.layer.cornerRadius = cornerRadius
        alphabetLabel.layer.masksToBounds = true
    }
}
