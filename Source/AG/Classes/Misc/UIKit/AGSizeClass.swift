//
//  AGSizeClass.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGSizeClass
public protocol AGSizeClass {
  
  static var transparent_inhaft: CGFloat { get }
  static var transparent: CGFloat { get }
  static var solid: CGFloat { get }
  static func diff(lhs: CGFloat, rhs: CGFloat, percent: CGFloat) -> CGFloat
  static func diffOrigin(lhs: CGPoint, rhs: CGPoint, percent: CGFloat) -> CGPoint
  static func diffSize(lhs: CGSize, rhs: CGSize, percent: CGFloat) -> CGSize
  static func getOrigin(parent: CGSize, with child: CGSize) -> CGPoint
  
}



//MARK: - Implements
public extension AGSizeClass {
  
  public static var transparent_inhaft: CGFloat {
    return -1.0000
  }
  
  public static var transparent: CGFloat {
    return 0.0001
  }
  
  public static var solid: CGFloat {
    return 1.0000
  }
  
  public static func diff(lhs: CGFloat, rhs: CGFloat, percent: CGFloat) -> CGFloat {
    return ((lhs - rhs) * percent) + rhs
  }
  
  public static func diffOrigin(lhs: CGPoint, rhs: CGPoint, percent: CGFloat) -> CGPoint {
    let x = diff(lhs: lhs.x, rhs: rhs.x, percent: percent)
    let y = diff(lhs: lhs.y, rhs: rhs.y, percent: percent)
    return CGPoint(x: x, y: y)
  }
  
  public static func diffSize(lhs: CGSize, rhs: CGSize, percent: CGFloat) -> CGSize {
    let w = diff(lhs: lhs.width, rhs: rhs.width, percent: percent)
    let h = diff(lhs: lhs.height, rhs: rhs.height, percent: percent)
    return CGSize(width: w, height: h)
  }
  
  public static func diffRect(lhs: CGRect, rhs: CGRect, percent: CGFloat) -> CGRect {
    let x = diff(lhs: lhs.origin.x, rhs: rhs.origin.x, percent: percent)
    let y = diff(lhs: lhs.origin.y, rhs: rhs.origin.y, percent: percent)
    let w = diff(lhs: lhs.width, rhs: rhs.width, percent: percent)
    let h = diff(lhs: lhs.height, rhs: rhs.height, percent: percent)
    return CGRect(x: x, y: y, width: w, height: h)
  }
  
  public static func getOrigin(parent: CGSize, with child: CGSize) -> CGPoint {
    return CGPoint(x: (parent.width - child.width) / 2, y: (parent.height - child.height) / 2)
  }
  
  public static func getCenter(frame: CGRect) -> CGPoint {
    return CGPoint(x: frame.height / 2, y: frame.width / 2)
  }
  
}
