//
//  ApplicationRoutable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 3/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - ApplicationRoutable
public protocol ApplicationRoutable: AGApplicationRoutable {
  
}



//MARK: - Implements
public extension ApplicationRoutable {
  
  public var isTimeOutEnable: Bool {
    return false
  }
  
  public func start(with launchOptions: [UIApplicationLaunchOptionsKey: Any]?, condition isLoggedIn: Bool) {
    guard canStart(with: launchOptions) else { return }
    if isLoggedIn {
      routeToMain()
    } else {
      routeToLogin()
    }
    
  }
  
  public func timeOut() {
    guard isTimeOutEnable else { return }
    
  }
  
  public func receiveCommon() {
    
  }
  
  public func receiveDeeplink() {
    
  }
  
  public func reviceNotification() {
    
  }
  
}



//MARK: - Common function
public extension ApplicationRoutable {
  
}



//MARK: - Scences
public extension ApplicationRoutable {

  public func routeToMain() {
    Storyboard.Main.mainVC()
    
  }
  
  public func routeToLogin() {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(withIdentifier: "MainVC") as! MainVC
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    Storyboard.Login.loginVC()
    
  }
  
}
