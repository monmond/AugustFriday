//
//  FontTextStylable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 17/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGFontTextStyleModel
public typealias AGFontTextStyleModel = [UIFont.TextStyle: AGFontModel]



//MARK: - AGFontTextStyle
public enum AGFontTextStyle {
  
  case system(weight: UIFont.Weight)
  case custom(name: String)
  
}



//MARK: - AGFontModel
public class AGFontModel {
  
  public let f_style: AGFontTextStyle
  public let f_size: CGFloat
  
  public init(f_style: AGFontTextStyle, f_size: CGFloat) {
    self.f_style = f_style
    self.f_size = f_size
  }
  
}


//MARK: - FontTextStylable
public protocol AGFontTextStylable {
  
  var name: String { get }
  var joined: String { get }
  var font: String { get }
  static var f_style: AGFontTextStyleModel { get }
  
}



//MARK: - Implements
public extension AGFontTextStylable where Self: RawRepresentable, Self.RawValue == String {
  
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
    guard let fm = f_style[style] else {
      return UIFont.preferredFont(forTextStyle: style)
    }
    let muliplies = UIApplication.shared.preferredContentSizeCategoryMuliplies
    switch fm.f_style {
    case let .custom(name: n):
      guard let font = UIFont(name: n, size: fm.f_size) else {
        return UIFont.preferredFont(forTextStyle: style)
      }
      if #available(iOS 11.0, *) {
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: font)
      } else {
        //Not working
        let font_descriptor = UIFontDescriptor(name: n, size: fm.f_size)
        return UIFont(descriptor: font_descriptor, size: font_descriptor.pointSize * muliplies)
      }
    case let .system(weight: w):
      let font = UIFont.systemFont(ofSize: fm.f_size, weight: w)
      if #available(iOS 11.0, *) {
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: font)
      } else {
        //Not working
        return UIFont.systemFont(ofSize: fm.f_size * muliplies, weight: w)
      }
    }
  }

}

