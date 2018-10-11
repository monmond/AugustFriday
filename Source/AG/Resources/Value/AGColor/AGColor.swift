//
//  AGColor.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public protocol AGColor {
  
  var color: UIColor { get }
  
  var cgColor: CGColor { get }
  
  func color(alpha: CGFloat) -> UIColor
  
  func cgColor(alpha: CGFloat) -> CGColor
  
}

public extension AGColor where Self: RawRepresentable, Self.RawValue == String {
  
  public var color: UIColor {
    if rawValue == "" { return UIColor.clear }
    return UIColor(hexString: rawValue)
  }
  
  public var cgColor: CGColor {
    if rawValue == "" { return UIColor.clear.cgColor }
    return UIColor(hexString: rawValue).cgColor
  }
  
  public func color(alpha: CGFloat) -> UIColor {
    if rawValue == "" { return UIColor.clear }
    return UIColor(hexString: rawValue).withAlphaComponent(CGFloat(alpha))
  }
  
  public func cgColor(alpha: CGFloat) -> CGColor {
    if rawValue == "" { return UIColor.clear.cgColor }
    return UIColor(hexString: rawValue).withAlphaComponent(CGFloat(alpha)).cgColor
  }
  
}


