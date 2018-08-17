//
//  Animatable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public protocol AGViewAnimation {
  
  func animateChange(_ onComplete: CallbackVoid?)
  func animateChangeWithDamping(_ onComplete: CallbackVoid?)
  
}

public extension AGViewAnimation where Self: UIViewController {
  
  public func animateChange(_ onComplete: CallbackVoid? = nil) {
    let options: UIViewAnimationOptions = [.curveEaseOut]
    UIView.animate(withDuration: 0.3, delay: 0.0, options: options, animations: {
      self.view.layoutIfNeeded()
    }, completion: { _ in
      onComplete?()
    })
  }
  
  public func animateChangeWithDamping(_ onComplete: CallbackVoid? = nil) {
    let options: UIViewAnimationOptions = [.curveEaseOut]
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   usingSpringWithDamping: 0.4,
                   initialSpringVelocity: 0.5,
                   options: options,
                   animations: {
                    self.view.layoutIfNeeded()
    }, completion: { _ in
      onComplete?()
    })
  }
  
}

