//
//  UIViewController + ext.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 29.11.2022.
//

import UIKit

extension UIViewController: UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NCollectionViewCell.items.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NCollectionViewCell.identifire, for: indexPath) as? NCollectionViewCell
        else {fatalError()}
        cell.label.text = NCollectionViewCell.items[indexPath.row]
        cell.textView.text = "indexPath.row = \(indexPath.row)"
        cell.backgroundColor = .black
        let l = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        l.itemSize = CGSize(width: 350, height: 350)
        return cell
    }
    
}
