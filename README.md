# ReuseCellConfigure

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/ReuseCellConfigure.svg?style=flat)](http://cocoapods.org/pods/ReuseCellConfigure)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ReuseCellConfigure.svg?style=flat)](http://cocoapods.org/pods/ReuseCellConfigure)

You can configure ReusableCell without casting!

Support Swift3 (If you want to use it in Swift3, please use [0.3.0-beta](https://github.com/marty-suzuki/ReuseCellConfigure/tree/0.3.0-beta))

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you install from pod, you have to write `import ReuseCellConfigure`.

```swift
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell?
    let alphabet = String(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(indexPath.row)))
    switch indexPath.row % 2 {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("LeftIconTableViewCell") { (cell: LeftIconTableViewCell) in
                cell.alphabetLabel.text = alphabet
                cell.randomBackgoundColor()
            }
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("RightIconTableViewCell") { (cell: RightIconTableViewCell) in
                cell.alphabetLabel.text = alphabet
            }
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
    }
    return cell!
}
```

```swift
func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    let reusableView: UICollectionReusableView? = nil
    switch UICollectionView.ElementKind(rawValue: kind) {
        case .Some(.Header):
            return collectionView.dequeueReusableSupplementaryViewOfKind(.Header, withReuseIdentifier: "Header", forIndexPath: indexPath) { (view: ReusableHeaderView) in
                view.backgroundColor = .redColor()
            }
        case .Some(.Footer):
            return collectionView.dequeueReusableSupplementaryViewOfKind(.Footer, withReuseIdentifier: "Footer", forIndexPath: indexPath) { (view: ReusableFooterView) in
                view.backgroundColor = .blueColor()
            }
        default:
            return reusableView
    }
}
```

## Deprecated methods

Those methods are deprecated since 0.2.3

#### UITableView

```swift
@available(*, deprecated=7.0, message="use \"dequeueReusableCellWithIdentifier(_:configure:)\"")
public func dequeueReusableCellWithIdentifier<T where T: UITableViewCell>(identifier: String, classForCell: T.Type, @noescape configure: T -> Void) -> T?

@available(*, deprecated=7.0, message="use \"dequeueReusableCellWithIdentifier(_:forIndexPath:configure:)\"")
public func dequeueReusableCellWithIdentifier<T where T: UITableViewCell>(identifier: String, forIndexPath indexPath: NSIndexPath, classForCell: T.Type, @noescape configure: T -> Void) -> UITableViewCell
```

#### UICollectionView

```swift
@available(*, deprecated=7.0, message="use \"dequeueReusableSupplementaryViewOfKind(_:withReuseIdentifier:forIndexPath:configure:)\"")
public func dequeueReusableSupplementaryViewOfKind<T where T: UICollectionReusableView>(elementKind: ElementKind, withReuseIdentifier identifier: String, forIndexPath indexPath: NSIndexPath, classForView: T.Type, @noescape configure: T -> Void) -> UICollectionReusableView

@available(*, deprecated=7.0, message="use \"dequeueReusableCellWithReuseIdentifier(_:forIndexPath:configure:)\"")
public func dequeueReusableCellWithReuseIdentifier<T where T: UICollectionViewCell>(identifier: String, forIndexPath indexPath: NSIndexPath, classForCell: T.Type, @noescape configure: T -> Void) -> UICollectionViewCell
```

## Requirements

- Xcode 7.0 or greater
- iOS 8.0 or greater

## Installation

#### CocoaPods

ReuseCellConfigure is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReuseCellConfigure"
```

#### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), simply add
ReuseCellConfigure to your `Cartfile`:

```
github "marty-suzuki/ReuseCellConfigure"
```
Make sure to add `ReuseCellConfigure.framework` to "Linked Frameworks and Libraries" and "copy-frameworks" Build Phases.

## Author

Taiki Suzuki, s1180183@gmail.com

## License

ReuseCellConfigure is available under the MIT license. See the LICENSE file for more info.
