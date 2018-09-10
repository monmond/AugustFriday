//
//  ApplicationSetup.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 3/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - ApplicationSetup
public protocol ApplicationSetup: AGApplicationSetup {
  
  func setupOnInit()
  func setupOnApplicationDidFinishLaunching()
  func setupOnDeinit()
  
}



//MARK: - Implements
public extension ApplicationSetup {
  
  public func setupOnInit() {
    
  }
  
  public func setupOnApplicationDidFinishLaunching() {
    setupNavigationBar()
    setupLogLevel()
    
  }
  
  public func setupOnDeinit() {
    
  }
  
}



//MARK: - Common functions
public extension ApplicationSetup {
  
}



//MARK: - Core Setups
public extension ApplicationSetup {
  
  private func setupNavigationBar() {
    let nb = UINavigationBar.appearance()
    nb.barStyle = .default
    nb.setBackgroundImage(UIImage(), for: .default)
    nb.isTranslucent = true
    nb.backgroundColor = .clear
    nb.shadowImage = UIImage()
    
  }
  
}


//MARK: - Core Setups
public extension ApplicationSetup {
  
  private func setupLogLevel() {
    AGLogConfiguration.shared.logLevel = .debug
    
  }
  
  private func setupAlamofire() {
    let agac = AGAlamofireConfiguration.shared
    agac.timeoutIntervalForRequest = 30
    //    agac.validator = nil
    
  }
  
}




