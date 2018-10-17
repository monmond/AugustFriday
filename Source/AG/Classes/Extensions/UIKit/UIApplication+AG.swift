//
//  UIApplication+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//extension UIApplication {
//
//  class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
//    if let nav = base as? UINavigationController {
//      return topViewController(base: nav.visibleViewController)
//    }
//    if let tab = base as? UITabBarController {
//      if let selected = tab.selectedViewController {
//        return topViewController(base: selected)
//      }
//    }
//    if let presented = base?.presentedViewController {
//      return topViewController(base: presented)
//    }
//    return base
//  }
//
//}




//MARK: - ContentSizeCategory
public extension UIApplication {
  
  public var preferredContentSizeCategoryMuliplies: CGFloat {
    get {
      switch UIApplication.shared.preferredContentSizeCategory {
      case .accessibilityExtraExtraExtraLarge: return 23 / 16
      case .accessibilityExtraExtraLarge: return 22 / 16
      case .accessibilityExtraLarge: return 21 / 16
      case .accessibilityLarge: return 20 / 16
      case .accessibilityMedium: return 19 / 16
      case .extraExtraExtraLarge: return 19 / 16
      case .extraExtraLarge: return 18 / 16
      case .extraLarge: return 17 / 16
      case .large: return 1.0
      case .medium: return 15 / 16
      case .small: return 14 / 16
      case .extraSmall: return 13 / 16
      default: return 1.0
      }
    }
  }
    
}


