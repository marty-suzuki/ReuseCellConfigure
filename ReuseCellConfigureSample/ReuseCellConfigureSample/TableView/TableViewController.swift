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
        tableView.registerNib(UINib(nibName: "LeftIconTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftIconTableViewCell")
        tableView.registerNib(UINib(nibName: "RightIconTableViewCell", bundle: nil), forCellReuseIdentifier: "RightIconTableViewCell")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int("Z".unicodeScalars.first!.value - "A".unicodeScalars.first!.value) + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell?
        let alphabet = String(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(indexPath.row)))
        switch indexPath.row % 2 {
            case 0:
                cell = tableView.dequeueReusableCellWithIdentifier("LeftIconTableViewCell", classForCell: LeftIconTableViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                    $0.randomBackgoundColor()
                }
            case 1:
                cell = tableView.dequeueReusableCellWithIdentifier("RightIconTableViewCell", classForCell: RightIconTableViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                }
            default:
                cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        }
        return cell!
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}