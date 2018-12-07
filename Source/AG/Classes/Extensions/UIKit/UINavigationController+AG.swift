//
//  UINavigationController+AG.Cons.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Block
public extension UINavigationController {
  
  public func popViewController(onComplete: CBVoid?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(onComplete)
    self.popViewController(animated: true)
    CATransaction.commit()
  }
  
  public func popToViewController(to vc: UIViewController, onComplete: CBVoid?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(onComplete)
    self.popToViewController(vc, animated: true)
    CATransaction.commit()
  }
  
  public func pushViewController(to vc: UIViewController, onComplete: CBVoid?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(onComplete)
    self.pushViewController(vc, animated: true)
    CATransaction.commit()
  }
  
  public func popViewController(count: Int, onComplete: CBVoid?) {
    guard let viewControllers = navigationController?.viewControllers else {
      return
    }
    var index = 0
    if count < viewControllers.count - 1 {
      index = count
    }
    navigationController?.popToViewController(to: viewControllers[index], onComplete: onComplete)
  }
  
}
