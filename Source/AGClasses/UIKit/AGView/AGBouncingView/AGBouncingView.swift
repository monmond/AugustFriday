//
//  AGBouncingView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/8/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public protocol AGBouncingView {
  
  func goSquash()
  func goIdentity()
  func goBouncing()
  
}



public extension AGBouncingView where Self: UIView {
  
  public func goSquash() {
    UIView.animate(withDuration: 0.1,
                   delay: 0.0,
                   options: .allowUserInteraction
      , animations: {
        self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
    }, completion: nil)
    
  }
  
  public func goIdentity() {
    UIView.animate(withDuration: 0.1,
                   delay: 0.0,
                   options: .allowUserInteraction
      , animations: {
        self.transform = .identity
    }, completion: nil)
  }
  
  public func goBouncing() {
    transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   usingSpringWithDamping: 0.2,
                   initialSpringVelocity: 6.0,
                   options: .allowUserInteraction
      , animations: {
        self.transform = CGAffineTransform.identity
    }, completion: { _ in
      
    })
  }
  
}




