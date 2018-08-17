//
//  UINavigationController+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public extension UINavigationController {
  
  public func popViewController(onComplete: CallbackVoid?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(onComplete)
    self.popViewController(animated: true)
    CATransaction.commit()
  }
  
  public func popToViewController(_ vc: UIViewController, onComplete: CallbackVoid?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(onComplete)
    self.popToViewController(vc, animated: true)
    CATransaction.commit()
  }
  public func pushViewController(vc: UIViewController, onComplete: CallbackVoid?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(onComplete)
    self.pushViewController(vc, animated: true)
    CATransaction.commit()
  }
  
}
