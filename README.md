# CheckBox
İOS UI CheckBox element

![alt tag](https://user-images.githubusercontent.com/16580898/28143183-0b173040-676d-11e7-85d3-0ceaec7dcfbe.png)

![Xcode 8.3+](https://img.shields.io/badge/xcode-8.3%2B-blue.svg)
![iOS 9.0+](https://img.shields.io/badge/İOS-9.0%2B-brightgreen.svg)
![Swift 3.0+](https://img.shields.io/badge/Swift-3.0%2B-orange.svg)
[![@uikenan](https://img.shields.io/badge/twitter-%40uikenan-red.svg)](http://twitter.com/uikenan)
[![contact](https://img.shields.io/badge/contact-www-orange.svg)](http://kenanatmaca.com)

## Advantages
- [X] Simply use.
- [X] Simply designable checkbox element.
- [X] Less code.

#### Usage

```Swift
    box = CheckBox(view: self.view, style: .oval)
    box.create(size: .small , center: CGPoint(x: 50, y: 50))
```

##### Control

```Swift
    box.state // true | false
```

##### Animation

```Swift
    box.animation = .scale
```

##### Remove

```Swift
    box.remove()
```

##### Set border & colors

```Swift
    box.contentColor = UIColor.red
    box.contentBorderColor = UIColor.black
    box.windowColor = UIColor.cyan
    box.windowBorderColor = UIColor.clear
    box.windowBorderWidth = 3
```



