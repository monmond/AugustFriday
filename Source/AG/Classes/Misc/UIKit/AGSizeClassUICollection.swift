//
//  AGSizeClassUICollection.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGSizeClassUICollection
public protocol AGSizeClassUICollection {
  static func size(with bound: CGRect) -> CGSize
  static func itemSpace(with bound: CGRect) -> CGFloat
  static func lineSpace(with bound: CGRect) -> CGFloat
  static func inset(with bound: CGRect) -> UIEdgeInsets
  static func offset(with bound: CGRect) -> CGPoint
}



//MARK: - Implements
public extension AGSizeClassUICollection {
  
  public static func size(with bound: CGRect = .zero) -> CGSize {
    return CGSize(width: bound.width, height: bound.width)
  }
  
  public static func itemSpace(with bound: CGRect = .zero) -> CGFloat {
    return 0
  }
  
  public static func lineSpace(with bound: CGRect = .zero) -> CGFloat {
    return 0
  }
  
  public static func inset(with bound: CGRect = .zero) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  public static func offset(with bound: CGRect = .zero) -> CGPoint {
    return .zero
  }
  
}
