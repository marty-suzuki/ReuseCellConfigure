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
        collectionView.register(UINib(nibName: "LeftCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LeftCollectionViewCell")
        collectionView.register(UINib(nibName: "RightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RightCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int("Z".unicodeScalars.first!.value - "A".unicodeScalars.first!.value) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let alphabet = String(describing: UnicodeScalar("A".unicodeScalars.first!.value + UInt32((indexPath as NSIndexPath).row)))
        let cell: UICollectionViewCell
        switch (indexPath as NSIndexPath).row % 2 {
            case 0:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeftCollectionViewCell", for: indexPath, to: LeftCollectionViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                    $0.randomBackgoundColor()
                }
            case 1:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RightCollectionViewCell", for: indexPath, to: RightCollectionViewCell.self) {
                    $0.alphabetLabel.text = alphabet
                }
            default:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        }
        return cell
    }
}
