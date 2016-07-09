# ReuseCellConfigure

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/ReuseCellConfigure.svg?style=flat)](http://cocoapods.org/pods/ReuseCellConfigure)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ReuseCellConfigure.svg?style=flat)](http://cocoapods.org/pods/ReuseCellConfigure)

You can configure ReusableCell without casting!

Support Swift3 (If you want to use it in Swift3, please use [0.3.0-beta](https://github.com/szk-atmosphere/ReuseCellConfigure/tree/0.3.0-beta))

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you install from pod, you have to write `import ReuseCellConfigure`.

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell?
    let alphabet = String(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(indexPath.row)))
    switch indexPath.row % 2 {
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
```

```swift
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let reusableView: UICollectionReusableView? = nil
    switch UICollectionView.ElementKind(rawValue: kind) {
        case .Some(.Header):
            return collectionView.dequeueReusableSupplementaryView(ofKind: .Header, withReuseIdentifier: "Header", for: indexPath, to: ReusableHeaderView.self) {
                $0.backgroundColor = .redColor()
            }
        case .Some(.Footer):
            return collectionView.dequeueReusableSupplementaryView(ofKind: .Footer, withReuseIdentifier: "Footer", for: indexPath, to: ReusableFooterView.self) {
                $0.backgroundColor = .blueColor()
            }
        default:
            return reusableView
    }
}
```

## Requirements

- Xcode 8.0beta or greater
- iOS 8.0 or greater

## Installation

#### CocoaPods

ReuseCellConfigure is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReuseCellConfigure", :git => 'https://github.com/szk-atmosphere/ReuseCellConfigure.git', :tag => '0.3.0-beta'
```

#### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), simply add
ReuseCellConfigure to your `Cartfile`:

```
github "szk-atmosphere/ReuseCellConfigure" "0.3.0-beta"
```
Make sure to add `ReuseCellConfigure.framework` to "Linked Frameworks and Libraries" and "copy-frameworks" Build Phases.

## Author

Taiki Suzuki, s1180183@gmail.com

## License

ReuseCellConfigure is available under the MIT license. See the LICENSE file for more info.
