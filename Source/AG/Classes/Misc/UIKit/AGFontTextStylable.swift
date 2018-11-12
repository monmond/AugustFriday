//
//  FontTextStylable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 17/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGFontTextStyle
public enum AGFontTextStyle {
  
  case system(weight: UIFont.Weight, size: CGFloat)
  case custom(name: String, size: CGFloat)
  
}



//MARK: - FontTextStylable
public protocol AGFontTextStylable {
  
  static var category: UIContentSizeCategory { get }
  var name: String { get }
  var joined: String { get }
  var font: String { get }
  static func fontTextStyle(with style: UIFont.TextStyle) -> AGFontTextStyle
  static func fontMultiply(with style: UIFont.TextStyle) -> CGFloat
  
}



//MARK: - Implements
public extension AGFontTextStylable where Self: RawRepresentable, Self.RawValue == String {
  
  public static var category: UIContentSizeCategory {
    return UIApplication.shared.preferredContentSizeCategory
  }
  
  public var name: String {
    return String(describing: Self.self)
  }
  
  public var joined: String {
    return ""
  }
  
  public var font: String {
    return "\(name)\(joined)\(rawValue.capitalized)"
  }
  
  public static func font(with style: UIFont.TextStyle) -> UIFont {
    let f_style = fontTextStyle(with: style)
    let f_multiply = fontMultiply(with: style)
    switch f_style {
    case let .custom(name: n, size: s):
      guard let font = UIFont(name: n, size: s * f_multiply) else {
        return UIFont.preferredFont(forTextStyle: style)
      }
      if #available(iOS 11.0, *) {
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: font)
      } else {
        //Not working
        let font_descriptor = UIFontDescriptor(name: n, size: s * f_multiply)
        return UIFont(descriptor: font_descriptor, size: font_descriptor.pointSize)
      }
    case let .system(weight: w, size: s):
      let font = UIFont.systemFont(ofSize: s * f_multiply, weight: w)
      if #available(iOS 11.0, *) {
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: font)
      } else {
        //Not working
        return UIFont.systemFont(ofSize: s * f_multiply, weight: w)
      }
    }
  }
  
  public static func fontMultiply(with style: UIFont.TextStyle) -> CGFloat {
    switch style {
    case .title1:
      switch category {
      case .accessibilityExtraExtraExtraLarge,
           .extraExtraExtraLarge,
           .accessibilityExtraLarge,
           .accessibilityLarge,
           .accessibilityMedium: return 19 / 16
      case .extraExtraExtraLarge: return 19 / 16
      case .extraExtraLarge: return 18 / 16
      case .extraLarge: return 17 / 16
      case .large: return 1.0
      case .medium: return 15 / 16
      case .small: return 14 / 16
      case .extraSmall: return 13 / 16
      default: return 1.0
      }
    default:
      return 1.0
    }
  }
  
}

