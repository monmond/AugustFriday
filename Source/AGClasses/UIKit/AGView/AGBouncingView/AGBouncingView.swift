//
//  AGBouncingView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/8/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import Spring



//MARK: - AGBouncingView
public protocol AGBouncingView {
  
  func goSquash()
  func goIdentity()
  func goBouncing()
  
}



//MARK: - Implements - UIView
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
    transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 7,
                   options: [.curveEaseOut, .allowUserInteraction]
      , animations: { [weak self] in
        guard let _s = self else { return }
        _s.transform = CGAffineTransform.identity
      }, completion: nil)
  }
  
}



//MARK: - Implements - UIView
public extension AGBouncingView where Self: SpringView {
  
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
    transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
    UIView.animate(withDuration: 0.2,
                   delay: 0,
                   usingSpringWithDamping: 1.0,
                   initialSpringVelocity: 3.0,
                   options: .allowUserInteraction
      , animations: { [weak self] in
        guard let _s = self else { return }
        _s.transform = CGAffineTransform.identity
      }, completion: { _ in
        UIView.animate(withDuration: 0.5, animations: {
          self.backgroundColor = UIColor(hex: "#279CEB")
        })
    })
  }
  
}




