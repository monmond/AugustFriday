//
//  AGApplicationSetup.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - AGApplicationSetup
public protocol AGApplicationSetup {
  
  func setupOnInit()
  func setupOnApplicationDidFinishLaunching()
  func setupOnDeinit()
  
}



//MARK: - Implements
public extension AGApplicationSetup {
  
  public func setupOnInit() {
    
  }
  
  public func setupOnApplicationDidFinishLaunching() {
    setupNavigationBar()
    
  }
  
  public func setupOnDeinit() {
    
  }
  
}



//MARK: - Common functions
public extension AGApplicationSetup {

  private func logFontFamilyNames() {
    for family in UIFont.familyNames.sorted() {
      print("Family: \(family)")
      for name in UIFont.fontNames(forFamilyName: family) {
        print("Font name: \(name)")
      }
    }
  }
  
}



//MARK: - Core Setups
public extension AGApplicationSetup {
  
  private func setupNavigationBar() {
    let nb = UINavigationBar.appearance()
    nb.barStyle = .default
    nb.setBackgroundImage(UIImage(), for: .default)
    nb.isTranslucent = true
    nb.backgroundColor = .clear
    nb.shadowImage = UIImage()
    
  }
  
}

