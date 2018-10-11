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
  static func size(_ bound: CGRect) -> CGSize
  static func itemSpace(_ bound: CGRect) -> CGFloat
  static func lineSpace(_ bound: CGRect) -> CGFloat
  static func inset(_ bound: CGRect) -> UIEdgeInsets
  static func offset(_ bound: CGRect) -> CGPoint
}



//MARK: - Implements
public extension AGSizeClassUICollection {
  
  public static func size(_ bound: CGRect = .zero) -> CGSize {
    return CGSize(width: bound.width, height: bound.width)
  }
  
  public static func itemSpace(_ bound: CGRect = .zero) -> CGFloat {
    return 0
  }
  
  public static func lineSpace(_ bound: CGRect = .zero) -> CGFloat {
    return 0
  }
  
  public static func inset(_ bound: CGRect = .zero) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  public static func offset(_ bound: CGRect = .zero) -> CGPoint {
    return .zero
  }
  
}
