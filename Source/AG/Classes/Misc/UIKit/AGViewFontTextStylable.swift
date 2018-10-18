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
  func viewFontTextAdjustsFonts(with font: UIFont)
  func viewFontTextAdjustsFont(with view: UIView, font: UIFont)
}



//MARK: - Implements
public extension AGViewFontTextStylable {
  
  public func viewFontTextAdjustsFonts(with font: UIFont) {
    for v in v_adjustsContentSizeCategorys {
      viewFontTextAdjustsFont(with: v, font: font)
    }
  }
  
  public func viewFontTextAdjustsFont(with view: UIView, font: UIFont) {
    if let btn = view as? UIButton, let lb = btn.titleLabel {
      lb.font = font
      lb.adjustsFontForContentSizeCategory = true
      lb.adjustsFontSizeToFitWidth = true
    }
    if let tv = view as? UITextView {
      tv.font = font
      tv.adjustsFontForContentSizeCategory = true
    }
    if let txt = view as? UITextField {
      txt.font = font
      txt.adjustsFontForContentSizeCategory = true
      txt.adjustsFontSizeToFitWidth = true
    }
    if let lb = view as? UILabel {
      lb.font = font
      lb.adjustsFontForContentSizeCategory = true
      lb.adjustsFontSizeToFitWidth = true
    }
  }
 
}
