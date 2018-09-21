//
//  UIViewController+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - Top view
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



//MARK: - Flow control
public extension UIViewController {

  public func present(viewControllerToPresent: UIViewController, transition: CATransition? = nil, completion: CallbackVoid? = nil) {
    if let t = transition {
      view.layer.add(t, forKey: nil)
    }
    present(viewControllerToPresent, animated: false, completion: completion)
  }
  
  public func dismiss(transition: CATransition? = nil, completion: CallbackVoid? = nil) {
    if let t = transition {
      view.layer.add(t, forKey: nil)
    }
    dismiss(animated: false, completion: completion)
  }
  
}



//MARK: - Update layout
public extension UIViewController {

  public func updateFrame() {
    view.setNeedsLayout()
    view.layoutIfNeeded()
    
  }
  
  public func animateChange(with duration: TimeInterval = 0.3) {
    UIView.animate(withDuration: duration, animations: {
      self.view.layoutIfNeeded()
    })
  }
  
}
