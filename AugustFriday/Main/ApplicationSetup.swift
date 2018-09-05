//
//  ApplicationSetup.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 3/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - ApplicationSetup
public protocol ApplicationSetup: AGApplicationSetup {

}



//MARK: - Implements
public extension ApplicationSetup {
  
  public func setupOnInit() {
    
  }
  
  public func setupOnApplicationDidFinishLaunching() {
    setupNavigationBar()
    
  }
  
  public func setupOnDeinit() {
    
  }
  
}



//MARK: - Common functions
public extension ApplicationSetup {
  
}



//MARK: - Setups
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

