//
//  CollectionViewController.swift
//  ReuseCellConfigureSample
//
//  Created by 鈴木 大貴 on 2016/01/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.registerNib(UINib(nibName: "LeftCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LeftCollectionViewCell")
        collectionView.registerNib(UINib(nibName: "RightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RightCollectionViewCell")
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int("Z".unicodeScalars.first!.value - "A".unicodeScalars.first!.value) + 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let alphabet = String(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(indexPath.row)))
        let cell: UICollectionViewCell
        switch indexPath.row % 2 {
            case 0:
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("LeftCollectionViewCell", forIndexPath: indexPath, classForCell: LeftCollectionViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                    $0.randomBackgoundColor()
                }
            case 1:
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("RightCollectionViewCell", forIndexPath: indexPath, classForCell: RightCollectionViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                }
            default:
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("UICollectionViewCell", forIndexPath: indexPath)
        }
        return cell
    }
}