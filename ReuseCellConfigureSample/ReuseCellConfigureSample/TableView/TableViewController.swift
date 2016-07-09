//
//  TableViewController.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木 大貴 on 2016/01/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import ReuseCellConfigure

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LeftIconTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftIconTableViewCell")
        tableView.register(UINib(nibName: "RightIconTableViewCell", bundle: nil), forCellReuseIdentifier: "RightIconTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int("Z".unicodeScalars.first!.value - "A".unicodeScalars.first!.value) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        let alphabet = String(UnicodeScalar("A".unicodeScalars.first!.value + UInt32((indexPath as NSIndexPath).row)))
        switch (indexPath as NSIndexPath).row % 2 {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: "LeftIconTableViewCell", to: LeftIconTableViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                    $0.randomBackgoundColor()
                }
            case 1:
                cell = tableView.dequeueReusableCell(withIdentifier: "RightIconTableViewCell", to: RightIconTableViewCell.self) {
                    $0.alphabetLabel.text = alphabet
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
