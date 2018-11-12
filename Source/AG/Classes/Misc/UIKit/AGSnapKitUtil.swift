//
//  SnapKitUtil.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import SnapKit



//MARK: - Constraint

public extension Constraint {
  
  public func constant(with index: Int) -> CGFloat {
    guard let loc = self.layoutConstraints.first else { return 0.0 }
    return loc.constant
  }
  
  public func constant(with item: AnyObject, attribute: NSLayoutConstraint.Attribute) -> CGFloat {
    guard let loc = self.layoutConstraints.first(where: {
      $0.firstItem === item && $0.firstAttribute == attribute
    }) else { return 0.0 }
    return loc.constant
  }
  
}



//MARK: - Constraint?
public extension Optional where Wrapped == Constraint {
  
  public func constant(with index: Int) -> CGFloat {
    guard let con = self else { return 0.0 }
    return con.constant(with: index)
  }
  
  public func constant(with item: AnyObject, attribute: NSLayoutConstraint.Attribute) -> CGFloat {
    guard let con = self else { return 0.0 }
    return con.constant(with: item, attribute: attribute)
  }
  
}
