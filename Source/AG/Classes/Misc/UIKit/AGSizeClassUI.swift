//
//  AGSizeClassUI.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Typealias
public typealias AGSizeClassUIRelative = (top: CGRect, right: CGRect, bottom: CGRect, left: CGRect)



//MARK: - AGSizeClassUI
public protocol AGSizeClassUI: AGSizeClass {
  
  static func or(with parent: CGRect, by relative: AGSizeClassUIRelative) -> CGRect
  static func dr(with parent: CGRect, by relative: AGSizeClassUIRelative) -> CGRect
  static func r(with parent: CGRect, by relative: AGSizeClassUIRelative, isOpen: Bool) -> CGRect
  static func df(with parent: CGRect, by relative: AGSizeClassUIRelative, percent: CGFloat) -> CGRect
  
}



//MARK: - Implements
public extension AGSizeClassUI {
  
  public static var NoneRelative: AGSizeClassUIRelative {
    return (.zero, .zero, .zero, .zero)
  }
  
  public static func dr(with parent: CGRect, by relative: AGSizeClassUIRelative = NoneRelative) -> CGRect {
    return or(with: parent, by: relative)
  }
  
  public static func r(with parent: CGRect, by relative: AGSizeClassUIRelative = NoneRelative, isOpen: Bool) -> CGRect {
    if isOpen {
      return or(with: parent, by: relative)
    } else {
      return dr(with: parent, by: relative)
    }
  }
  
  public static func df(with parent: CGRect, by relative: AGSizeClassUIRelative = NoneRelative, percent: CGFloat) -> CGRect {
    let lhs = or(with: parent, by: relative)
    let rhs = dr(with: parent, by: relative)
    return diffRect(lhs: lhs, rhs: rhs, percent: percent)
  }
  
}




