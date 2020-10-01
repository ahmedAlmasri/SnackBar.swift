# SnackBar.swift

[![Version](https://img.shields.io/cocoapods/v/SnackBar.swift.svg?style=flat)](https://cocoapods.org/pods/SnackBar.swift)
[![License](https://img.shields.io/cocoapods/l/SnackBar.swift.svg?style=flat)](https://cocoapods.org/pods/SnackBar.swift)
[![Platform](https://img.shields.io/cocoapods/p/SnackBar.swift.svg?style=flat)](https://cocoapods.org/pods/SnackBar.swift)

`SnackBar` provide brief feedback about an operation through a message at the bottom of the screen. `SnackBar` contain up to two lines of text directly related to the operation performed. They may contain a text action.

## Screenshots

<img src="Screenshot/screenshot.gif">

## Using

Without Action

```Swift
SnackBar.make(in: self.view, message: "The Internet connection appears to be offline.", duration: .lengthLong).show()
```

With Action

```Swift
 SnackBar.make(in: self.view, message: "The Internet connection appears to be offline.", duration: .lengthLong).setAction(with: "Retry", action: {

   print("retry Tapped")

  }).show()
```

Change Style

```Swift
class AppSnackBar: SnackBar {
	
	override var style: SnackBarStyle {
		var style = SnackBarStyle()
		style.background = .red
		style.textColor = .green
		return style
	}
}

 AppSnackBar.make(in: self.view, message: "The Internet connection appears to be offline.", duration: .lengthLong).show()

```

## Duration

| Duration | Value  |
|----|---|
| lengthLong | 3.5 |
| lengthShort | 2 |
| infinite | Manual dismiss or swipe SnackBar (left, right, up, down)|
| custom(CGFloat) | Based on your input |


## Style

| Attribute | Type  |  Default value |
|----|---|--|
| style.background | UIColor | UIColor.systemGray6 |
| style.textColor | UIColor | UIColor.label |
| style.font | UIFont | UIFont.systemFont(ofSize: 14) |
| style.actionTextColorAlpha | CGFloat | 0.5 |
| style.actionFont | UIFont | UIFont.systemFont(ofSize: 17) |
| style.actionTextColor | UIColor | UIColor.red |


## Requirements

* iOS 12.0+
* Swift 5.0+
* Xcode 10.0+

## Installation

### CocoaPods

SnackBar.swift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SnackBar.swift'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `SnackBar` into your Xcode project using Xcode 11 or newer, specify it in `File > Swift Packages > Add`:

```
https://github.com/ahmedAlmasri/SnackBar.swift
```

## Author

Ahmad Almasri, ahmed.almasri@ymail.com

## License

SnackBar.swift is available under the MIT license. See the LICENSE file for more info.
