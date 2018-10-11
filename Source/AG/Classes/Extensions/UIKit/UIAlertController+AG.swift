//
//  UIAlertController+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Getter
public extension UIAlertController {
  
  public var alertActionView: UIView? {
    return view.subviews.first?.subviews.first?.subviews.first
  }
  
  public var cancelActionView: UIView? {
    return view.recursiveSubviews.compactMap({
      $0 as? UILabel}
      ).first(where: {
        $0.text == actions.first(where: { $0.style == .cancel })?.title
      })?.superview?.superview
  }
  
}
