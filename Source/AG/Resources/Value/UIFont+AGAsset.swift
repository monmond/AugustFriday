//
//  UIFont+AGAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

//extension UIFont {
//
//  @objc
//  fileprivate class func mySystemFont(ofSize size: CGFloat) -> UIFont {
//    return AppFont.DBAdmanX.regular.with(size: size)
//  }
//
//  @objc
//  fileprivate class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
//    return AppFont.DBAdmanX.bold.with(size: size)
//  }
//
//  @objc
//  fileprivate class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
//    return AppFont.DBAdmanX.italic.with(size: size)
//  }
//
//  class func boldItalicSystemFont(ofSize size: CGFloat) -> UIFont {
//    return AppFont.DBAdmanX.boldItalic.with(size: size)
//  }
//
//  class func lightItalicSystemFont(ofSize size: CGFloat) -> UIFont {
//    return AppFont.DBAdmanX.lightItalic.with(size: size)
//  }
//
//  class func lightSystemFont(ofSize size: CGFloat) -> UIFont {
//    return AppFont.DBAdmanX.light.with(size: size)
//  }
//
//}
//
//extension UIFont {
//
//  convenience init(myCoder aDecoder: NSCoder) {
//    guard let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor else {
//      self.init(myCoder: aDecoder)
//      return
//    }
//    guard let fontAttribute = fontDescriptor.fontAttributes["NSCTFontUIUsageAttribute"] as? String else {
//      self.init(myCoder: aDecoder)
//      return
//    }
//    var fontName = ""
//    switch fontAttribute {
//    case "CTFontRegularUsage":
//      fontName = AppFont.DBAdmanX.regular.fontName
//    case "CTFontEmphasizedUsage", "CTFontBoldUsage":
//      fontName = AppFont.DBAdmanX.bold.fontName
//    case "CTFontObliqueUsage":
//      fontName = AppFont.DBAdmanX.italic.fontName
//    default:
//      fontName = AppFont.DBAdmanX.regular.fontName
//    }
//    self.init(name: fontName, size: fontDescriptor.pointSize)!
//  }
//
//  class func overrideInitialize() {
//    if self == UIFont.self {
//      let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:)))
//      let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:)))
//      method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
//
//      let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:)))
//      let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:)))
//      method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
//
//      let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:)))
//      let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:)))
//      method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
//
//      let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))) // Trick to get over the lack of UIFont.init(coder:))
//      let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:)))
//      method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
//    }
//  }
//
//}
//
//
