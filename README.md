# ReuseCellConfigure

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/ReuseCellConfigure.svg?style=flat)](http://cocoapods.org/pods/ReuseCellConfigure)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ReuseCellConfigure.svg?style=flat)](http://cocoapods.org/pods/ReuseCellConfigure)

You can configure ReusableCell without casting!

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you install from pod, you have to write `import ReuseCellConfigure`.

```swift
// LeftIconTableViewCell.swift
class LeftIconTableViewCell: UITableViewCell, ReusableViewProtocol {
    typealias RegisterType = RegisterNib
}

// ViewController.swift
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
```

```swift
// ReusableHeaderView.swift
class LeftIconTableViewCell: UICollectionReusableView, ReusableViewProtocol {
    typealias RegisterType = RegisterClass
}

// ViewController.swift
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let reusableView: UICollectionReusableView? = nil
    switch UICollectionView.ElementKind(rawValue: kind) {
        case .Some(.Header):
            return collectionView.dequeue(with: ReusableHeaderView.self, of: .Header, for: indexPath) { view in
                view.backgroundColor = .redColor()
            }
        case .Some(.Footer):
            return collectionView.dequeue(with: ReusableHeaderView.self, of: .Footer, for: indexPath) { view in
                view.backgroundColor = .blueColor()
            }
        default:
            return reusableView
    }
}
```

## Requirements

- Xcode 9.1 or greater
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
