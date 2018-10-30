//
//  AGFont.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//




//MARK: - Imports
import UIKit



//MARK: - Font
public extension AG.F {
  
  public enum System: String, AGFontTextStylable {
    case regular = ""
  }
  
}




//MARK: - System
public extension AG.F.System {
  
  public var a: UIFont.Weight {
    return .ultraLight
  }
  public static var f_style: AGFontTextStyleModel {
    let style: AGFontTextStyleModel = [
      .title1: AGFontModel(f_style: .system(weight: .regular), f_size: 28),
      .title2: AGFontModel(f_style: .system(weight: .regular), f_size: 22),
      .title3: AGFontModel(f_style: .system(weight: .regular), f_size: 20),
      .headline: AGFontModel(f_style: .system(weight: .bold), f_size: 17),
      .subheadline: AGFontModel(f_style: .system(weight: .semibold), f_size: 15),
      .body: AGFontModel(f_style: .system(weight: .regular), f_size: 14),
      .callout: AGFontModel(f_style: .system(weight: .regular), f_size: 16),
      .footnote: AGFontModel(f_style: .system(weight: .regular), f_size: 13),
      .caption1: AGFontModel(f_style: .system(weight: .semibold), f_size: 12),
      .caption2: AGFontModel(f_style: .system(weight: .semibold), f_size: 10)
    ]
    return style
  }
  
}

























