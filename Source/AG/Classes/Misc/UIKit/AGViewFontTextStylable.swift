//
//  AGViewFontTextStylable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 17/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGViewFontTextStylable
public protocol AGViewFontTextStylable {
  var v_adjustsContentSizeCategorys: [UIView] { get }
  func viewFontTextAdjustsFont(with font: UIFont)
  func viewFontTextAdjustsFont(with view: UIView, font: UIFont)
  func viewFontTextAdjustsFontviewFontTextAdjustsSetupLabel(with label: UILabel, font: UIFont)
}



//MARK: - Implements
public extension AGViewFontTextStylable {
  
  public func viewFontTextAdjustsFont(with font: UIFont) {
    for v in v_adjustsContentSizeCategorys {
      viewFontTextAdjustsFont(with: v, font: font)
    }
  }
  
  public func viewFontTextAdjustsFont(with view: UIView, font: UIFont) {
    if let btn = view as? UIButton, let lb = btn.titleLabel {
      viewFontTextAdjustsFont(with: lb, font: font)
    }
    if let lb = view as? UILabel {
      viewFontTextAdjustsFont(with: lb, font: font)
    }
  }
  
  public func viewFontTextAdjustsFont(with label: UILabel, font: UIFont) {
    label.font = font
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
  }
  
}
