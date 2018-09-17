//
//  UIWindow.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 24/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation
import UIKit



public extension UIWindow {
  
}



public extension UIWindow {
  
  public enum Transition {
    case fade
  }
  
  public func set(with root: UIViewController, transition: Transition? = nil) {
    let previousViewController = rootViewController
    if let type = transition {
      let transition = CATransition()
      transition.duration = 0.3
      switch type {
      case .fade:
        transition.type = kCATransitionFade
      }
      layer.add(transition, forKey: kCATransition)
    }
    rootViewController = root
    
    if UIView.areAnimationsEnabled {
      UIView.animate(withDuration: CATransaction.animationDuration()) {
        root.setNeedsStatusBarAppearanceUpdate()
      }
    } else {
      root.setNeedsStatusBarAppearanceUpdate()
    }
    
    if let transitionViewClass = NSClassFromString("UITransitionView") {
      for subview in subviews where subview.isKind(of: transitionViewClass) {
        subview.removeFromSuperview()
      }
    }
    
    if let previousViewController = previousViewController {
      previousViewController.dismiss(animated: false) {
        previousViewController.view.removeFromSuperview()
      }
    }
  }
  
  //  func set(rootViewController newRootViewController: UIViewController, withTransition transition: CATransition? = nil) {
  //    let previousViewController = rootViewController
  //    if let transition = transition {
  //      layer.add(transition, forKey: kCATransition)
  //    }
  //    rootViewController = newRootViewController
  //
  //    if UIView.areAnimationsEnabled {
  //      UIView.animate(withDuration: CATransaction.animationDuration()) {
  //        newRootViewController.setNeedsStatusBarAppearanceUpdate()
  //      }
  //    } else {
  //      newRootViewController.setNeedsStatusBarAppearanceUpdate()
  //    }
  //
  //    if let transitionViewClass = NSClassFromString("UITransitionView") {
  //      for subview in subviews where subview.isKind(of: transitionViewClass) {
  //        subview.removeFromSuperview()
  //      }
  //    }
  //
  //    if let previousViewController = previousViewController {
  //      previousViewController.dismiss(animated: false) {
  //        previousViewController.view.removeFromSuperview()
  //      }
  //    }
  //  }
  
}



public enum SwapRootVCAnimationType {
  case Push
  case Pop
  case Present
  case Dismiss
}



public extension UIWindow {
  
  public func setController(_ newViewController:UIViewController, animationType:SwapRootVCAnimationType, completion: (() -> ())? = nil) {
    guard let currentViewController = rootViewController else {
      return
    }
    
    let width = currentViewController.view.frame.size.width;
    let height = currentViewController.view.frame.size.height;
    
    var newVCStartAnimationFrame: CGRect?
    var currentVCEndAnimationFrame:CGRect?
    
    var newVCAnimated = true
    
    switch animationType {
    case .Push:
      newVCStartAnimationFrame = CGRect(x: width, y: 0, width: width, height: height)
      currentVCEndAnimationFrame = CGRect(x: 0 - width/4, y: 0, width: width, height: height)
    case .Pop:
      currentVCEndAnimationFrame = CGRect(x: width, y: 0, width: width, height: height)
      newVCStartAnimationFrame = CGRect(x: 0 - width/4, y: 0, width: width, height: height)
      newVCAnimated = false
    case .Present:
      newVCStartAnimationFrame = CGRect(x: 0, y: height, width: width, height: height)
    case .Dismiss:
      currentVCEndAnimationFrame = CGRect(x: 0, y: height, width: width, height: height)
      newVCAnimated = false
    }
    
    newViewController.view.frame = newVCStartAnimationFrame ?? CGRect(x: 0, y: 0, width: width, height: height)
    
    addSubview(newViewController.view)
    
    if !newVCAnimated {
      bringSubview(toFront: currentViewController.view)
    }
    
    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
      if let currentVCEndAnimationFrame = currentVCEndAnimationFrame {
        currentViewController.view.frame = currentVCEndAnimationFrame
      }
      newViewController.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }, completion: { finish in
      self.rootViewController = newViewController
      completion?()
    })
    makeKeyAndVisible()
  }
  
}

