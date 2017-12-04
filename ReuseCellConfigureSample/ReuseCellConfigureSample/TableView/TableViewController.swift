//
//  TableViewController.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木 大貴 on 2016/01/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import ReuseCellConfigure

final class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(with: LeftIconTableViewCell.self)
        tableView.register(with: RightIconTableViewCell.self)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int("Z".unicodeScalars.first!.value - "A".unicodeScalars.first!.value) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        let alphabet = String(describing: UnicodeScalar("A".unicodeScalars.first!.value + UInt32(indexPath.row))!)
        switch indexPath.row % 2 {
        case 0:
            cell = tableView.dequeue(with: LeftIconTableViewCell.self) { cell in
                cell.alphabetLabel.text = alphabet
                cell.randomBackgoundColor()
            }
        case 1:
            cell = tableView.dequeue(with: RightIconTableViewCell.self) { cell in
                cell.alphabetLabel.text = alphabet
            }
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        }
        return cell!
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
