//
//  ReuseCellConfigure.swift
//  ReuseCellConfigure
//
//  Created by Taiki Suzuki on 2016/01/02.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

//MARK: - UITableView Extension
public extension UITableView {
    public func dequeueReusableCellWithIdentifier<T where T: UITableViewCell>(identifier: String, classForCell: T.Type, @noescape configure: T -> Void) -> T? {
        guard let cell = dequeueReusableCellWithIdentifier(identifier) as? T else { return nil }
        configure(cell)
        return cell
    }
    
    public func dequeueReusableCellWithIdentifier<T where T: UITableViewCell>(identifier: String, forIndexPath indexPath: NSIndexPath, classForCell: T.Type, @noescape configure: T -> Void) -> UITableViewCell {
        let reusableCell = dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        guard let cell = reusableCell as? T else { return reusableCell }
        configure(cell)
        return cell
    }
}

//MARK: - UICollectionView Extension
public extension UICollectionView {
    public enum ElementKind {
        case Header
        case Footer
        
        init?(rawValue: String) {
            switch rawValue {
            case UICollectionElementKindSectionHeader: self = .Header
            case UICollectionElementKindSectionFooter: self = .Footer
            default: return nil
            }
        }
        
        var value: String {
            switch self {
            case .Header: return UICollectionElementKindSectionHeader
            case .Footer: return UICollectionElementKindSectionFooter
            }
        }
    }
    
    public func registerNib(nib: UINib?, forSupplementaryViewOfKind kind: ElementKind, withReuseIdentifier identifier: String) {
        registerNib(nib, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: identifier)
    }
    
    public func registerClass(viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: ElementKind, withReuseIdentifier identifier: String) {
        registerClass(viewClass, forSupplementaryViewOfKind: elementKind.value, withReuseIdentifier: identifier)
    }
    
    public func dequeueReusableSupplementaryViewOfKind(elementKind: ElementKind, withReuseIdentifier identifier: String, forIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        return dequeueReusableSupplementaryViewOfKind(elementKind.value, withReuseIdentifier: identifier, forIndexPath: indexPath)
    }
    
    public func dequeueReusableSupplementaryViewOfKind<T where T: UICollectionReusableView>(elementKind: ElementKind, withReuseIdentifier identifier: String, forIndexPath indexPath: NSIndexPath, classForView: T.Type, @noescape configure: T -> Void) -> UICollectionReusableView {
        let reusableView = dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier, forIndexPath: indexPath)
        guard let view = reusableView as? T else { return reusableView }
        configure(view)
        return view
    }
    
    public func dequeueReusableCellWithReuseIdentifier<T where T: UICollectionViewCell>(identifier: String, forIndexPath indexPath: NSIndexPath, classForCell: T.Type, @noescape configure: T -> Void) -> UICollectionViewCell {
        let reusableCell = dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
        guard let cell = reusableCell as? T else { return reusableCell }
        configure(cell)
        return cell
    }
}