//
//  AGFont.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public protocol AGFont {
  
  var name: String { get }
  func with(size: CGFloat) -> UIFont
  
}

public extension AGFont where Self: RawRepresentable, Self.RawValue == String {
  
  public var fontName: String {
    var font = ""
    switch rawValue {
    case "":
      font = name
    default:
      font = "\(name)-\(rawValue.localizedCapitalized)"
    }
    return font
  }
  
  public func with(size: CGFloat) -> UIFont {
    return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
}

