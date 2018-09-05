//
//  AGApplicationRoutable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - AGApplicationWindow
public protocol AGApplicationWindow {
  
  var window: UIWindow? { get set }
  
}



//MARK: - AGApplicationRoutable
public protocol AGApplicationRoutable: AGApplicationWindow {
  
  var isTimeOutEnable: Bool { get }
  func start(with launchOptions: [UIApplicationLaunchOptionsKey: Any]?, condition isLoggedIn: Bool)
  func timeOut()
  func receiveCommon()
  func receiveDeeplink()
  func reviceNotification()
  func routeToMain()
  func routeToLogin()
  
}



//MARK: - Implements
public extension AGApplicationRoutable {
  
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



//MARK: - Common functions
public extension AGApplicationRoutable {

  public func canStart(with launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let isLaunchWithOption = !(launchOptions == nil)
    let isFromSourceApplication = (launchOptions ?? [:]).keys.contains(.sourceApplication)
    return !isLaunchWithOption || !isFromSourceApplication
    
  }
  
}



//MARK: - Scences
public extension AGApplicationRoutable {
  
  public func routeToMain() {
    
  }
  
  public func routeToLogin() {
    
  }
  
}
