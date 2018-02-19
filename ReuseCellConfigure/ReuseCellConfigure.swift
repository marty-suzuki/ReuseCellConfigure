//
//  ReuseCellConfigure.swift
//  ReuseCellConfigure
//
//  Created by Taiki Suzuki on 2016/01/02.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

//MARK: - ReusableViewProtocol
public protocol ReusableViewRegisterType {}
public enum RegisterNib: ReusableViewRegisterType {}
public enum RegisterClass: ReusableViewRegisterType {}

public protocol ReusableViewProtocol {
    associatedtype RegisterType: ReusableViewRegisterType
    static var identifier: String { get }
    static var originalNib: UINib? { get }
}

extension ReusableViewProtocol {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension ReusableViewProtocol where RegisterType == RegisterNib {
    public static var originalNib: UINib? {
        return nil
    }

    public static var nib: UINib {
        return originalNib ?? UINib(nibName: identifier, bundle: nil)
    }
}

extension ReusableViewProtocol where RegisterType == RegisterClass {
    public static var originalNib: UINib? {
        return nil
    }
}

//MARK: - UITableView Extension
public extension UITableView {
    public typealias ReusableCell = ReusableViewProtocol & UITableViewCell
    public typealias ReusableView = ReusableViewProtocol & UITableViewHeaderFooterView

    public func register<T: ReusableCell>(with type: T.Type) where T.RegisterType == RegisterNib {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }

    public func register<T: ReusableCell>(with type: T.Type) where T.RegisterType == RegisterClass {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    public func register<T: ReusableView>(with type: T.Type) where T.RegisterType == RegisterNib {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }

    public func register<T: ReusableView>(with type: T.Type) where T.RegisterType == RegisterClass {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    public func dequeue<T: ReusableCell>(with type: T.Type, configure: (T) -> Void) -> UITableViewCell? {
        let cell = dequeueReusableCell(withIdentifier: T.identifier)
        if let cell = cell as? T {
            configure(cell)
        }
        return cell
    }

    public func dequeue<T: ReusableCell>(with type: T.Type, for indexPath: IndexPath, configure: (T) -> Void) -> UITableViewCell {
        let reusableCell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        guard let cell = reusableCell as? T else { return reusableCell }
        configure(cell)
        return cell
    }

    public func dequeue<T: ReusableView>(with type: T.Type, configure: (T) -> Void) -> UITableViewHeaderFooterView? {
        let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier)
        if let view = view as? T {
            configure(view)
        }
        return view
    }
}

//MARK: - UICollectionView Extension
public extension UICollectionView {
    public typealias ReusableCell = ReusableViewProtocol & UICollectionViewCell
    public typealias ReusableView = ReusableViewProtocol & UICollectionReusableView

    public enum ElementKind {
        case header
        case footer
        
        public init?(rawValue: String) {
            switch rawValue {
            case UICollectionElementKindSectionHeader: self = .header
            case UICollectionElementKindSectionFooter: self = .footer
            default: return nil
            }
        }
        
        public var value: String {
            switch self {
            case .header: return UICollectionElementKindSectionHeader
            case .footer: return UICollectionElementKindSectionFooter
            }
        }
    }

    public func register<T: ReusableCell>(with type: T.Type) where T.RegisterType == RegisterNib {
        register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }

    public func register<T: ReusableCell>(with type: T.Type) where T.RegisterType == RegisterClass {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    public func register<T: ReusableView>(with type: T.Type, of kind: ElementKind) where T.RegisterType == RegisterNib {
        register(T.nib, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: T.identifier)
    }

    public func register<T: ReusableView>(with type: T.Type, of kind: ElementKind) where T.RegisterType == RegisterClass {
        register(T.self, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: T.identifier)
    }

    public func dequeue<T: ReusableCell>(with type: T.Type, for indexPath: IndexPath, configure: (T) -> Void) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath)
        if let cell = cell as? T {
            configure(cell)
        }
        return cell
    }
    
    public func dequeue<T: ReusableView>(with type: T.Type, of elementKind: ElementKind, for indexPath: IndexPath, configure: (T) -> Void) -> UICollectionReusableView {
        let view = dequeueReusableSupplementaryView(ofKind: elementKind.value, withReuseIdentifier: T.identifier, for: indexPath)
        if let view = view as? T {
            configure(view)
        }
        return view
    }
}
