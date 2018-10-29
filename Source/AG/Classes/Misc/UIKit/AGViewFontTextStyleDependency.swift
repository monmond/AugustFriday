//
//  AGViewFontTextStyleDependency.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 17/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGViewFontTextStyleDependency
public protocol AGViewFontTextStyleDependency {
  
  func viewFontTextAdjustsFonts(with views: [UIView], font: UIFont)
  func viewFontTextAdjustsFont(with view: UIView, font: UIFont)
  
}



//MARK: - Implements
public extension AGViewFontTextStyleDependency {
  
  public func viewFontTextAdjustsFonts(with views: [UIView], font: UIFont) {
    for v in views {
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
