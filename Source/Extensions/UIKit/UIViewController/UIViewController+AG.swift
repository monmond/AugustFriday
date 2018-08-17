//
//  UIViewController+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public extension UIViewController {
  
  public static var top: UIViewController? {
    get {
      return topViewController()
    }
  }
  
  public static var root: UIViewController? {
    get {
      return UIApplication.shared.delegate?.window??.rootViewController
    }
  }
  
  public static func topViewController(from viewController: UIViewController? = UIViewController.root) -> UIViewController? {
    if let tabBarViewController = viewController as? UITabBarController {
      return topViewController(from: tabBarViewController.selectedViewController)
    } else if let navigationController = viewController as? UINavigationController {
      return topViewController(from: navigationController.visibleViewController)
    } else if let presentedViewController = viewController?.presentedViewController {
      return topViewController(from: presentedViewController)
    } else {
      return viewController
    }
  }
  
}


public extension UIViewController {
  
  public func popViewController(_ count: Int, onComplete: CallbackVoid?) {
    guard let viewControllers = navigationController?.viewControllers else {
      return
    }
    var index = 0
    if count < viewControllers.count - 1 {
      index = count
    }
    navigationController?.popToViewController(viewControllers[index], onComplete: onComplete)
  }
  
  public func pushTransition() -> CATransition {
    let transition = CATransition()
    transition.duration = 0.3
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFade
    return transition
  }
  
}
