//
//  AGNavigationViewManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public class AGNavigationViewManager: NSObject {
  
  fileprivate var vc: (UIViewController & AGNavigationBarProtocol)!
  fileprivate var v_navigation: UIView!
  
  public init(vc: (UIViewController & AGNavigationBarProtocol)) {
    self.vc = vc
    
  }
  
  deinit {
    deposeView()
    
  }
  
}



//MARK: - Life Cycle
public extension AGNavigationViewManager {
  
  
  
}



//MARK: - Setup UI
public extension AGNavigationViewManager {
  
  fileprivate func setupView() {
    v_navigation = AGNavigationView()
    vc.view.addSubview(v_navigation)
    
    v_navigation.translatesAutoresizingMaskIntoConstraints = false
    
    v_navigation.topAnchor.constraint(equalTo: vc.view.topAnchor).isActive = true
    v_navigation.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor).isActive = true
    v_navigation.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor).isActive = true
    v_navigation.bottomAnchor.constraint(equalTo: vc.cons_topLayoutGuideTop).isActive = true
    
  }
  
}



//MARK: - Depose UI
public extension AGNavigationViewManager {
  
  fileprivate func deposeView() {
    vc = nil
    v_navigation = nil
    
  }
  
}



//MARK: - Common Function
public extension AGNavigationViewManager {
  
  public func create() {
    setupView()
    
  }
  
  public func removeFromSuperview() {
    v_navigation.removeFromSuperview()
    
  }
  
  public func fadeIn() {
    //    curveEaseIn
    UIView.transition(with: v_navigation, duration: 0.5, options: .transitionCrossDissolve
      , animations: {
        self.v_navigation.alpha = 1
    }, completion: nil)
    
  }
  
  public func fadeOut() {
    UIView.transition(with: v_navigation, duration: 0.2, options: .transitionCrossDissolve
      , animations: {
        self.v_navigation.alpha = 0
    }, completion: nil)
    
  }
  
  public func setupColor(color: AGColor) {
    v_navigation.backgroundColor = color.color
    
  }
  
}
