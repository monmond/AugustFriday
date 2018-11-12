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
  public static func fontTextStyle(with style: UIFont.TextStyle) -> AGFontTextStyle {
    switch style {
    case .title1: return .system(weight: .regular, size: 28)
    case .title2: return .system(weight: .regular, size: 22)
    case .title3: return .system(weight: .regular, size: 20)
    case .headline: return .system(weight: .bold, size: 17)
    case .body: return .system(weight: .regular, size: 17)
    case .callout: return .system(weight: .regular, size: 16)
    case .subheadline: return .system(weight: .semibold, size: 15)
    case .footnote: return .system(weight: .regular, size: 13)
    case .caption1: return .system(weight: .semibold, size: 12)
    case .caption2: return .system(weight: .semibold, size: 11)
    default: return .system(weight: .regular, size: 16)
    }
  }
  
}

























