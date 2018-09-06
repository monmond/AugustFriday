//
//  AGApplicationBlurable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - AGApplicationBlurable
public protocol AGApplicationBlurable: AGApplicationWindow {

  var kTag: Int { get }
  var isBlurable: Bool { get }
  
}



//MARK: - Implements
public extension AGApplicationBlurable {
  
  public var kTag: Int {
    return 12345
  }
  
  public var isBlurable: Bool {
    return true
  }
  
}


//MARK: - Common functions
public extension AGApplicationBlurable {

  public func setupBlurableObserverListeners() {
    let nc = NotificationCenter.default
    nc.addObserver(forName: .UIApplicationWillEnterForeground, object: nil, queue: nil) {
      self.applicationWillEnterForeground($0)
    }
    nc.addObserver(forName: .UIApplicationWillResignActive, object: nil, queue: nil) {
      self.applicationWillResignActive($0)
    }
    nc.addObserver(forName: .UIApplicationDidBecomeActive, object: nil, queue: nil) {
      self.applicationDidBecomeActive($0)
    }
    
  }
  
  private func applicationWillEnterForeground(_ notification: Notification) {
    AGLog.debug(#function, scope: AGApplicationBlurable.self)
    unBlur()
    
  }
  
  
  private func applicationWillResignActive(_ notification: Notification) {
    AGLog.debug(#function, scope: AGApplicationBlurable.self)
    blur()
    
  }
  
  private func applicationDidBecomeActive(_ notification: Notification) {
    AGLog.debug(#function, scope: AGApplicationBlurable.self)
    unBlur()
    
  }
  
  private func blur() {
    guard isBlurable else { return }
    let effect = UIBlurEffect(style: .dark)
    let v_blur = UIVisualEffectView(effect: effect)
    v_blur.frame = window!.frame
    v_blur.tag = kTag
    v_blur.alpha = 0
    window?.addSubview(v_blur)
    window?.bringSubview(toFront: v_blur)
    UIView.animate(withDuration: 0.2, animations: {
      v_blur.alpha = 1.0
    })
    
  }
  
  private func unBlur() {
    guard isBlurable else { return }
    guard let v_blur = window?.viewWithTag(kTag) else {
      return
    }
    UIView.animate(withDuration: 0.2, animations: {
      v_blur.alpha = 0
    }, completion: {
      _ in
      v_blur.removeFromSuperview()
    })
    
  }
  
}
